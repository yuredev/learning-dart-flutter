import 'package:flutter/material.dart';
import './percentage_vertical_bar.dart';

class DayReport extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const DayReport({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder serve para colocar componentes 
    // dentro que são de um tamanho proporcional ao componente 
    // pai. Nele colocamos os valores de forma percentual
    // Ele recebe um builder para 
    // renderizar um componente 
    // a callback recebe o ctx e contraints 
    // através do ctx podemos usar porcentagens
    // nos componentes filhos de LayouBuilder
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            // diminui o tamanho do componente filho caso não caiba
            // no tamanho disponível
            // sem ele o texto continuaria do mesmo tamanho e faria um wrap
            // ou aumentaria o tamanho do componente, afastando os componentes vizinhos
            child: FittedBox(
              child: Text(
                '${value.toStringAsFixed(2)}',
              ),
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(
            alignment: Alignment.center,
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: PercentageVerticalBar(percentage),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label)),
          ),
        ],
      ),
    );
  }
}
