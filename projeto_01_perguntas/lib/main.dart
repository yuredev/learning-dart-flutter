import 'package:flutter/material.dart';
import './Questao.dart';
import './Resposta.dart';

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
  }
  
  // o build deve ser repassado para o State uma vez que ele
  // depende do estado
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual o seu game favorito?',
        'respostas': ['Skyrim', 'The Witcher 3', 'Dark Souls 3', 'Red Dead Redemption 2']
      },
      {
        'texto': 'Qual o seu anime favorito?',
        'respostas': ['One Piece', 'Shingeki no Kyojin', 'Dragon Ball Z', 'One Punch Man']
      },
      {
        'texto': 'Qual o seu filme favorito?',
        'respostas': ['LOTR', 'Cidade de Deus', 'Star Wars', 'Clube da Luta']
      },
    ];

    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
    // maps retornam um Iterable ao invés de uma List 
    // assim é preciso acionar o método toList() de Iterable. para assim converter em map
    List<Resposta> widgets = respostas.map((r) => Resposta(r, _responder)).toList();

    // for(String resp in respostas) {
    //   widgets.add(Resposta(resp, _responder));
    // }

    return MaterialApp(
      // Scaffold é como uma estrutura
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          title: Text('PerguntasApp'),
        ),
        // o body pode receber mais de um Widget
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...widgets // o spread tbm existe no Flutter
            // cada um dos elementos da lista de widgets será jogado aqui
          
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