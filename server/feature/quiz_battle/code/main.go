package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"sync"

	"github.com/go-redis/redis/v8"
	"github.com/gorilla/websocket"
	"github.com/joho/godotenv"
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

func init() {

	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	redisURL := os.Getenv("REDIS_URL")
	if redisURL == "" {
		log.Fatalf("REDIS_URL environment variable not set")
	}

	opt, err := redis.ParseURL(redisURL)
	if err != nil {
		log.Fatalf("Could not parse Redis URL: %v", err)
	}
	rdb = redis.NewClient(opt)

	// Redisサーバーに接続できるか確認
	_, err = rdb.Ping(ctx).Result()
	if err != nil {
		log.Fatalf("Could not connect to Redis: %v", err)
	}
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

func handleConnections(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println("Upgrade error:", err)
		return
	}

	userID := conn.RemoteAddr().String()
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
	log.Println("Server started on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
