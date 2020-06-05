import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _texto; 
  final void Function() _onPressed;

  Resposta(this._texto, this._onPressed);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // toda a largura da tela
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.deepPurple[400],
        child: Text(_texto),
        onPressed: _onPressed
      ),
    );
  }
}