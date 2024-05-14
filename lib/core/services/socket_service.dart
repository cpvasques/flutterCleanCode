// ignore_for_file: library_prefixes, avoid_print
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:injectable/injectable.dart';

@lazySingleton
class SocketService {
  final String _baseUrl = 'http://localhost:3000';
  final Map<String, IO.Socket> _sockets = {};

  void connect(String path) {
    final url = '$_baseUrl$path';
    if (_sockets.containsKey(url)) {
      disconnect(path);
    }

    final socket =
        IO.io(url, IO.OptionBuilder().setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('Connected to socket server at $url');
    });

    socket.onDisconnect((_) {
      print('Disconnected from socket server at $url');
    });

    _sockets[url] = socket;
  }

  void disconnect(String path) {
    final url = '$_baseUrl$path';
    if (_sockets.containsKey(url)) {
      _sockets[url]!.disconnect();
      _sockets.remove(url);
      print('Socket disconnected from $url');
    }
  }

  void disconnectAll() {
    for (var socket in _sockets.values) {
      socket.disconnect();
    }
    _sockets.clear();
  }

  void emit(String path, String event, dynamic data) {
    final url = '$_baseUrl$path';
    _sockets[url]?.emit(event, data);
  }

  void on(String path, String event, Function(dynamic) callback) {
    final url = '$_baseUrl$path';
    _sockets[url]?.on(event, callback);
  }

  void off(String path, String event, [void Function(dynamic)? callback]) {
    final url = '$_baseUrl$path';
    _sockets[url]?.off(event, callback);
  }
}




// DOC

// void main() {
// Instância do SocketService usando injeção de dependência (GetIt)
// final _socketService = GetIt.instance<SocketService>();

// Conectar a um servidor de socket em um caminho específico
// _socketService.connect('/channel');

// Exemplo de callback ao conectar-se ao servidor de socket
// _socketService.on('/channel', 'connect', (data) {
//   print('Connected to channel socket: $data');
// });

// Emitir um evento para o servidor de socket
// message é o nome do evento que o backend irá disparar para nós
// _socketService.emit('/channel', 'message', {'text': 'Hello, channel!'});

// Ouvir eventos do servidor de socket
// message é o nome do evento que o backend irá disparar para nós
// _socketService.on('/channel', 'message', (data) {
//   print('Received message from channel: $data');
// });

// Desconectar de um servidor de socket específico
// _socketService.disconnect('/channel');

// Desconectar de todos os servidores de socket
// _socketService.disconnectAll();

// Remover um listener de um evento específico
// _socketService.off('/channel', 'message');
// }