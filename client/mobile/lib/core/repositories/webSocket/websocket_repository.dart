import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_repository.g.dart';

@Riverpod(keepAlive: true)
WebSocketRepository webSocketRepository(
    WebSocketRepositoryRef ref, {
      required String endPoint,
      required String initialToken,
    }
) {
  return WebSocketRepository(endPoint, initialToken);
}

class WebSocketRepository {
  WebSocketRepository(this._url, this._token);

  final String _url;
  String _token;
  WebSocketChannel? _channel;


  void updateToken(String newToken) {
    _token = newToken;
    if (isConnected) {
      reconnect();
    }
  }


  Future<void> connect() async {
    try {
      _channel = IOWebSocketChannel.connect(
        Uri.parse(_url),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );
      await _channel?.ready;
    } on Exception catch (e){
      throw Exception('Failed to connect to $_url: $e');
    }
  }


  void send(String message) {
    if (_channel != null) {
      _channel!.sink.add(message);
    } else {
      throw Exception('WebSocket is not connected');
    }
  }


  Stream<dynamic> get messages {
    if (_channel != null) {
      return _channel!.stream;
    } else {
      throw Exception('WebSocket is not connected');
    }
  }


  Future<void> close() async {
    await _channel?.sink.close();
    _channel = null;
  }


  bool get isConnected => _channel != null;


  Future<void> reconnect() async {
    await close();
    await connect();
  }
}