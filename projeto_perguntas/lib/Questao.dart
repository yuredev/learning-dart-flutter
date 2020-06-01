import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String _texto;

  Questao(this._texto);

  @override
  Widget build(BuildContext context) {
    return Text(_texto);
  }
}