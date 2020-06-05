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
  double _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual o seu game favorito?',
      'respostas': [
        {'texto': 'Skyrim', 'pontuacao': 10.0}, 
        {'texto': 'The Witcher 3', 'pontuacao': 4.5}, 
        {'texto': 'Dark Souls 3', 'pontuacao': 4.5}, 
        {'texto': 'Red Dead Redemption 2', 'pontuacao': 6.0}
      ]
    },
    {
      'texto': 'Qual o seu anime favorito?',
      'respostas': [
        {'texto': 'One Piece', 'pontuacao': 10.0}, 
        {'texto': 'Shingeki no Kyojin', 'pontuacao': 1.7}, 
        {'texto': 'Dragon Ball Z', 'pontuacao': 1.0}, 
        {'texto': 'One Punch Man', 'pontuacao': 0.0}
      ]
    },
    {
      'texto': 'Qual o seu filme favorito?',
      'respostas': [
        {'texto': 'LOTR', 'pontuacao': 10.0}, 
        {'texto': 'Cidade de Deus', 'pontuacao': 7.5}, 
        {'texto': 'Star Wars', 'pontuacao': 0.5}, 
        {'texto': 'Clube da Luta', 'pontuacao': 5.0}
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _resetar() {
    this.setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(double pontuacao) {
    if (temPerguntaSelecionada) {
      this.setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }
  
  // o build deve ser repassado para o State uma vez que ele
  // depende do estado
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada ?
      _perguntas[_perguntaSelecionada]['respostas'] :
      null;

    // maps retornam um Iterable ao invés de uma List 
    // assim é preciso acionar o método toList() de Iterable. para assim converter em map

    List<Resposta> widgets;

    // em Dart tem que colocar o != de nulo
    // não é suportado colocar diretamente a variável como no JS
    if (respostas != null) {
      widgets = respostas.map((r) => Resposta(r['texto'], () => _responder(r['pontuacao']))).toList();
    }
    
    return MaterialApp(
      // Scaffold é como uma estrutura
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          title: Center(child: Text('YureApp'))
        ),
        // o body pode receber mais de um Widget
        body: temPerguntaSelecionada ? 
          Questionario(_perguntas[_perguntaSelecionada]['texto'], widgets) :
          Resultado(_pontuacaoTotal, _resetar)
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