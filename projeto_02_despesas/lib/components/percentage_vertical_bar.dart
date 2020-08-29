import 'package:flutter/material.dart';

class PercentageVerticalBar extends StatelessWidget {
  final double percentage;

  PercentageVerticalBar(this.percentage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            color: Color.fromRGBO(220, 220, 220, 1),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // Widget que tem o tamanho fracionado do tamanho disponível
        // que deveria ser
        FractionallySizedBox(
          heightFactor: percentage,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
