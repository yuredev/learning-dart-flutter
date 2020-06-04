import 'package:flutter/material.dart';
import 'package:projeto_perguntas/Questionario.dart';
import './Resposta.dart';
import './Resultado.dart';

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
  
  final List<Map<String, Object>> _perguntas = const [
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

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      this.setState(() => _perguntaSelecionada++);
    }
  }
  
  // o build deve ser repassado para o State uma vez que ele
  // depende do estado
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada ?
      _perguntas[_perguntaSelecionada]['respostas'] :
      null;

    // maps retornam um Iterable ao invés de uma List 
    // assim é preciso acionar o método toList() de Iterable. para assim converter em map

    List<Resposta> widgets;

    // em Dart tem que colocar o != de nulo
    // não é suportado colocar diretamente a variável como no JS
    if (respostas != null) {
      widgets = respostas.map((r) => Resposta(r, _responder)).toList();
    }
    
    return MaterialApp(
      // Scaffold é como uma estrutura
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          title: Text('YureApp'),
        ),
        // o body pode receber mais de um Widget
        body: temPerguntaSelecionada ? 
          Questionario(_perguntas[_perguntaSelecionada]['texto'], widgets) :
          Resultado()
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