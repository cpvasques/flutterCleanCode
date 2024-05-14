// ignore_for_file: library_prefixes, avoid_print
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

@lazySingleton
class SocketService {
  IO.Socket? _socket;

  void connect(String url) {
    if (_socket != null) {
      disconnect();
    }

    _socket =
        IO.io(url, IO.OptionBuilder().setTransports(['websocket']).build());

    _socket!.onConnect((_) {
      print('Connected to socket server');
    });

    _socket!.onDisconnect((_) {
      print('Disconnected from socket server');
    });
  }

  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket = null;
      print('Socket disconnected');
    }
  }

  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  void off(String event, [dynamic Function(dynamic)? callback]) {
    _socket?.off(event, callback);
  }
}



// Exemplo de utilização

// void main() {
// final SocketService _socketService = getIt<SocketService>();

//   Conectar ao servidor de socket
//   _socketService.connect('http://localhost:3000');

//   Enviar uma mensagem
//   _socketService.emit('message', {'text': 'Hello, world!'});

//   Escutar eventos
//   _socketService.on('message', (data) {
//     print('Received message: $data');
//   });

//   Desconectar quando não for mais necessário
//   _socketService.disconnect();
// }