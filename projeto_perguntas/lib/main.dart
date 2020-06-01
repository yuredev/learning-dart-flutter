import 'package:flutter/material.dart';

// runApp deve receber uma instância do Widget principal

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  // quem passa o context é o próprio Flutter
  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = <String>[
      'Qual seu anime favorito?',
      'Qual sua banda favorita?',
      'Qual seu game favorito?'
    ];

    void responder() {
      print('Pergunta respondida');
    }

    return MaterialApp(
      // Scaffold é como uma estrutura
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        // o body pode receber mais de um Widget
        body: Column(
          children: <Widget>[
            Text(perguntas[2]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: () {
                print('Resposta 2');
              },
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: () => print('Resposta 3'),
            ),
            RaisedButton(
              child: Text('Botão desabilitado'),
              onPressed: null,
            ),
          ],
        ),
      )
    );
  }
}
