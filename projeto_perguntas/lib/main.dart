import 'package:flutter/material.dart';
import './Questao.dart';

// No Flutter o estado de um Widget e seu gerenciamento
// fica em uma classe diferente do próprio componente

// os métodos build e reponder ficam dentro da parte de
// gerencia de estado pois estes dependem do estado
// para funcionar

// runApp deve receber uma instância do Widget principal

main() => runApp(PerguntaApp());

// no generics do State colocamos o componente ligado ao
// gerenciamento de estado
class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  void _responder() {
    // o setState do Flutter recebe uma callback
    this.setState(() => _perguntaSelecionada++);
    print('Pergunta respondida $_perguntaSelecionada');
  }
  
  // o build deve ser repassado para o State uma vez que ele
  // depende do estado
  Widget build(BuildContext context) {
    final List<String> perguntas = <String>[
      'Qual seu anime favorito?',
      'Qual sua banda favorita?',
      'Qual seu game favorito?'
    ];
    return MaterialApp(
      // Scaffold é como uma estrutura
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        // o body pode receber mais de um Widget
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'), 
              onPressed: _responder
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
          ],
        ),
      )
    );
  }
}

// O StatefulWidget é o Widget responsável por criar o estado
// esse componente é o que estará presente na arvore de componentes
class PerguntaApp extends StatefulWidget {
  // quem passa o context é o próprio Flutter
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
