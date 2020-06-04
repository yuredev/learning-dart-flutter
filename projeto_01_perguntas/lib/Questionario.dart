import 'package:flutter/material.dart';
import './Resposta.dart';
import './Questao.dart';

class Questionario extends StatelessWidget {
  // como os atributos são final
  // é opcional o uso de _ antes dos atributos
  // uma vez que o atributo sendo final 
  // já impede que ele seja mutado de fora da classe 
  final String pergunta;
  final List<Resposta> respostas;

  Questionario(this.pergunta, this.respostas);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(pergunta),
        ...respostas 
      ],
    );
  }
}