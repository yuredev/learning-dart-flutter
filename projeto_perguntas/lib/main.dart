import 'package:flutter/material.dart';

// runApp deve receber uma instância do Widget principal

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {

  // quem passa o context é o próprio Flutter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold é como uma estrutura 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Text('Olá Flutter'),
      )
    );
  }
}