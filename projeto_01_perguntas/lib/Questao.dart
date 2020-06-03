import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String _texto;

  Questao(this._texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // valor máximo do double
      // EdgeInsets.fromLTRB margens Left, Top, Right, Bottom
      // margin: EdgeInsets.fromLTRB(10, 10, 10, 10), // isso poderia ser simplificado em...
      margin: EdgeInsets.all(10),
      child: Text(
        _texto, 
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center
      ),
    );
  }
}
