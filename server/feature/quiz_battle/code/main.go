package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"sync"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
	"github.com/go-redis/redis/v8"
	"github.com/gorilla/websocket"
	"github.com/joho/godotenv"
	"google.golang.org/api/option"
)

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

var rdb *redis.Client
var ctx = context.Background()

var connections = make(map[string]*websocket.Conn)
var connectionsMutex sync.Mutex
var waitingUserMutex sync.Mutex

var authClient *auth.Client
var firestoreClient *firestore.Client

func init() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	firebaseCredentialsPath := os.Getenv("Firebase_SDK")
	if firebaseCredentialsPath == "" {
		log.Fatalf("Firebase_SDK environment variable not set")
	}

	// カレントディレクトリを取得
	currentDir, err := os.Getwd()
	if err != nil {
		log.Fatalf("カレントディレクトリの取得に失敗: %v", err)
	}

	// 相対パスを絶対パスに変換
	absolutePath := filepath.Join(currentDir, firebaseCredentialsPath)

	// Firebase Admin SDK の初期化
	ctx := context.Background()
	firebaseOpt := option.WithCredentialsFile(absolutePath)
	app, err := firebase.NewApp(ctx, nil, firebaseOpt)
	if err != nil {
		log.Fatalf("Firebase の初期化エラー: %v", err)
	}

	authClient, err = app.Auth(ctx)
	if err != nil {
		log.Fatalf("Firebase Authentication の初期化エラー: %v", err)
	}

	firestoreClient, err = app.Firestore(ctx)
	if err != nil {
		log.Fatalf("Firestore の初期化エラー: %v", err)
	}

	redisURL := os.Getenv("REDIS_URL")
	if redisURL == "" {
		log.Fatalf("REDIS_URL environment variable not set")
	}

	redisOpt, err := redis.ParseURL(redisURL)
	if err != nil {
		log.Fatalf("Could not parse Redis URL: %v", err)
	}
	rdb = redis.NewClient(redisOpt)

	// Redisサーバーに接続できるか確認
	_, err = rdb.Ping(ctx).Result()
	if err != nil {
		log.Fatalf("Could not connect to Redis: %v", err)
	}
}

func verifyIDToken(ctx context.Context, idToken string) (*auth.Token, error) {
	// ID トークンの検証
	token, err := authClient.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, fmt.Errorf("ID トークンの検証エラー: %v", err)
	}
	return token, nil
}

func setWaitingUser(userID string) error {
	return rdb.Set(ctx, "waitingUser", userID, 0).Err()
}

func getWaitingUser() (string, error) {
	return rdb.Get(ctx, "waitingUser").Result()
}

func deleteWaitingUser() error {
	return rdb.Del(ctx, "waitingUser").Err()
}

func fetchUserData(ctx context.Context, uid string) (map[string]interface{}, error) {
	docRef := firestoreClient.Collection("users").Doc(uid)
	doc, err := docRef.Get(ctx)
	if err != nil {
		return nil, fmt.Errorf("ユーザーデータの取得エラー: %v", err)
	}
	return doc.Data(), nil
}

func handleConnections(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()

	if authClient == nil {
		log.Println("Firebase Authentication client is not initialized")
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	// Authorization ヘッダーから ID トークンを取得
	authHeader := r.Header.Get("Authorization")
	if authHeader == "" {
		http.Error(w, "Authorization ヘッダーがありません", http.StatusUnauthorized)
		return
	}
	idToken := strings.TrimPrefix(authHeader, "Bearer ")

	// ID トークンの検証
	token, err := verifyIDToken(ctx, idToken)
	if err != nil {
		http.Error(w, err.Error(), http.StatusUnauthorized)
		return
	}

	userID := token.UID // Use Firebase UID instead of connection address

	log.Printf("Authenticated user: %s", userID)

	// Firestoreからユーザーデータを取得
	userData, err := fetchUserData(ctx, userID)
	if err != nil {
		log.Printf("ユーザーデータの取得に失敗: %v", err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	// ユーザーデータの利用例（ログに出力）
	log.Printf("User data: %v", userData)

	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println("Upgrade error:", err)
		return
	}

	connectionsMutex.Lock()
	connections[userID] = conn
	connectionsMutex.Unlock()

	waitingUserMutex.Lock()
	waitingUserID, err := getWaitingUser()
	if err == redis.Nil {
		// No waiting user
		setWaitingUser(userID)
		waitingUserMutex.Unlock()

		err := conn.WriteMessage(websocket.TextMessage, []byte("Waiting for another user to join..."))
		if err != nil {
			log.Println("WriteMessage error (waiting user):", err)
			conn.Close()
			connectionsMutex.Lock()
			delete(connections, userID)
			connectionsMutex.Unlock()

			waitingUserMutex.Lock()
			deleteWaitingUser()
			waitingUserMutex.Unlock()
		}
	} else if err != nil {
		log.Println("Redis get error:", err)
		waitingUserMutex.Unlock()
		conn.Close()
		connectionsMutex.Lock()
		delete(connections, userID)
		connectionsMutex.Unlock()
		return
	} else {
		// Found a waiting user
		deleteWaitingUser()
		waitingUserMutex.Unlock()

		connectionsMutex.Lock()
		partnerConn := connections[waitingUserID]
		delete(connections, waitingUserID)
		delete(connections, userID)
		connectionsMutex.Unlock()

		err := conn.WriteMessage(websocket.TextMessage, []byte("Matched with a user!"))
		if err != nil {
			log.Println("WriteMessage error (current user):", err)
			conn.Close()
			if partnerConn != nil {
				partnerConn.Close()
			}
			return
		}

		if partnerConn != nil {
			err = partnerConn.WriteMessage(websocket.TextMessage, []byte("Matched with a user!"))
			if err != nil {
				log.Println("WriteMessage error (partner user):", err)
				conn.Close()
				partnerConn.Close()
				return
			}
		}

		go handleMatch(conn, partnerConn)
		handleMatch(partnerConn, conn)
	}
}

func handleMatch(user1, user2 *websocket.Conn) {
	for {
		_, msg, err := user1.ReadMessage()
		if err != nil {
			log.Println("ReadMessage error (user1):", err)
			user1.Close()
			if user2 != nil {
				user2.Close()
			}
			return
		}

		if string(msg) == "quit" {
			user1.WriteMessage(websocket.TextMessage, []byte("quit"))
			if user2 != nil {
				user2.WriteMessage(websocket.TextMessage, []byte("quit"))
			}
			user1.Close()
			if user2 != nil {
				user2.Close()
			}
			return
		}

		if user2 != nil {
			err = user2.WriteMessage(websocket.TextMessage, msg)
			if err != nil {
				log.Println("WriteMessage error (user2):", err)
				user1.Close()
				user2.Close()
				return
			}
		}
	}
}

func main() {
	http.HandleFunc("/ws", handleConnections)
	port := "8080"
	log.Printf("Server started on :%s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
