import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double pontuacao;
  final void Function() callbackResetar;

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Cê é o bixão mermo ein doido!!';
    }
  }
  
  Resultado(this.pontuacao, this.callbackResetar);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Text(
          'Pontuação $pontuacao', 
          style: TextStyle(fontSize: 20),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.deepPurple[400],
          child: Text('Resetar'),
          onPressed: callbackResetar
        )
      ],
    );
  }
}