import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            child: Text('Item 1'),
            color: Colors.red,
          ),
          Flexible(
            // FlexFit.loose
            // o tamanho do widget
            // será o tamanho mínimo necessário
            // para exibir seu conteúdo
            // é o loose que vem por padrão nos widgets
            // fit: FlexFit.loose,

            // o FlexFit.tight faz com que o widget
            // ocupa o máximo de espaço que conseguir
            // se ele for o único tight de seus vizinhos
            // ele pegará todo o resto do espaço que está
            // em branco
            fit: FlexFit.tight,

            // se outro vizinho deste widget tiver 
            // tambem o FlexFit.tight
            // o espaço restante será dividido
            // entre eles 
            // a não ser que se use a propriedade flex

            // a propriedade flex define qual widget 
            // tem prioridade em relação à ocupação
            // se em uma row há 3 itens 
            // 2 deles tem flex: 2
            // significa que o valor do espaço vazio é 4
            // e cada um dos que tem flex 2
            // pegará 2/4 do espaço vazio
            // ou seja. cada um pega metade

            // se a soma dos flex é 10 
            // e um widget tem flex: 7
            // este pegará 70% dos espaços vazios

            // por padrão o flex vem 1 para todos flexibles

            // colocando flex 2 neste widget
            // o valor dos espaços vazios será 3
            // por conta de seu vizinho ter um flex: 1 oculto
            // assim este widget pegará 2/3 dos espaços vazios
            flex: 2,  
            child: Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.blue,
            ),
          ),
          Flexible(
            // vem por default mesmo se não colocado
            // flex: 1,

            // fit: FlexFit.tight,

            // se este elemento usar um loose 
            // ele não tentará extender o máximo possível
            // apenas ocupará o suficiente 
            // dos espaços vazios pra exibir seu conteúdo
            // assim o boa parte do espaço não será ocupado 
            // por ninguém 
            // porém ficará a disposição deste componente 
            // pra caso ele aumente de tamanho
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.orange,
            ),
          ),
          // o Expanded widget 
          // é a mesma coisa do Flexible com a diferença 
          // que ele é por padrão FlexFit.tight
          // e ele não tem a propriedade fit
          // uma vez que ele é sempre tight
          // Expanded(
          //   child: Container(
          //     height: 100,
          //     child: Text('Item 3'),
          //     color: Colors.orange,
          //   ),
          // ),
        ],
      ),
    );
  }
}
