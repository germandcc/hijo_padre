import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Data Transfer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _receivedData = "Nada recibido aún";

  // Este método será llamado por el hijo para enviar datos al padre
  void _updateData(String data) {
    setState(() {
      _receivedData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Padre'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Dato desde el hijo:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Center(
            child: Text(
              _receivedData,
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ChildWidget(
              onDataSent: _updateData, // Pasamos el callback al hijo
            ),
          ),
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(String) onDataSent;

  // El constructor recibe el callback desde el padre
  ChildWidget({required this.onDataSent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aquí el hijo envía datos al padre usando el callback
        onDataSent("Hola, soy el Widget Hijo!");
      },
      child: Text('Enviar Dato al Padre'),
    );
  }
}
