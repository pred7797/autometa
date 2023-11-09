import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TextInputPage extends StatefulWidget {
  @override
  _TextInputPageState createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  TextEditingController textController = TextEditingController();
  IO.Socket _socket = IO.io('http://localhost:3002',IO.OptionBuilder().setTransports(['websocket']).build());

  _connectSocket(){
    _socket.onConnect((data) => print('esatablished connection'));
    _socket.onConnectError((data) => print('connection error $data'));
    _socket.onDisconnect((data) => print(' connection disconnected'));    
  }

  @override
  void initState() {
    super.initState();
    _connectSocket();

    // _socket.on('connect', (_) {
    //   print('Socket connected to server');
    // });

    // _socket.on('disconnect', (_) {
    //   print('Socket disconnected from server');
    // });

    // _socket.connect(); // Manually connect the socket here
  }

  void sendMessage(String message) {
    if (_socket.connected) {
      _socket.emit(
          'custom', message); // Send the message when the socket is connected
      print('Sent message: $message');
    } else {
      print('Socket is not connected to the server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Type a message'),
            ),
            ElevatedButton(
              onPressed: () {
                String message = textController.text;
                sendMessage(message);
              },
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
