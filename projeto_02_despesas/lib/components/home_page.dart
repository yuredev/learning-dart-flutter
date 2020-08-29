// para usar o Random
import 'dart:math';
// dart io permite saber qual plataforma o app está
// sendo executado
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekly_expenses/components/chart.dart';
import 'package:weekly_expenses/components/transaction_form.dart';
import 'package:weekly_expenses/components/transaction_list.dart';
import 'package:weekly_expenses/models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  /// retorna true se a data passada
  /// é mais recente do que 7 dias atrás
  bool _youngerThan7days(DateTime date) {
    return date.isAfter(DateTime.now().subtract(Duration(days: 7)));
  }

  /// retorna as transações dos últimos 7 dias */
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return _youngerThan7days(tr.date);
    }).toList();
  }

  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  void _addTransaction(String title, double value, DateTime date) {
    var firstUpper =
        (String word) => word.substring(0, 1).toUpperCase() + word.substring(1);

    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: firstUpper(title),
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    // pega navigator e dá um pop
    // ou seja remove a ultima camada da pilha
    // da aplicação que no caso é o modal
    // presente no componente TransactionForm
    // off de Navigator é um método estático
    // assim não é preciso criar uma instancia
    // de Navigator para usar o metódo
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    // abre um modal novo de cadastro passando o componente
    // TransactionForm
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionForm(_addTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // modo paisagem
    bool islandscape = media.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final iconChart =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    Widget _getIconButton(IconData icon, Function fn) {
      return Platform.isIOS
          ? GestureDetector(onTap: fn, child: Icon(icon))
          : IconButton(icon: Icon(icon), onPressed: fn);
    }

    final actions = <Widget>[
      if (islandscape)
        _getIconButton(
          _showChart ? iconList : iconChart,
          () {
            setState(() => _showChart = !_showChart);
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            title: Text(
              'Despesas Pessoais',
              // style: TextStyle(
              //   por padrão o text scale factor é 1
              //   caso o usuário modifique o tamanho das fontes
              //   nas configurações do celular este scale pode ser 0.75, 1.25, 1.5, 2...
              //   exemplo: se o usuário configurou 1.5 o tamanho da fonte
              //   se colocarmos 10 * media.textScaleFactor, o tamanho da fonte será 10 * 1.5 = 15
              //   fontSize: 20 * media.textScaleFactor,
              // ),
            ),
            actions: actions,
          )
        : CupertinoNavigationBar(
            middle: Text('Despesas Pessoais'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          );

    // pegar altura total da aplicação
    final appTotalHeight = media.size.height;
    // pega altura da appBar
    final appBarHeight = appBar.preferredSize.height;
    // pega altura do statusBar do celular
    final statusBarHeight = media.padding.top;
    // o tamanho disponível será a subtração do total pelos appBar Height e statusBarHeight
    final avaliableHeight = appTotalHeight - appBarHeight - statusBarHeight;

    // SafeArea é para o IOS
    // ele faz desconsiderar o espaço de cima próximo a borda da tela
    // além de desconsiderar o espaço abaixo onde o usuário pode fazer ações
    final bodyPage = SafeArea(
      // o componente SingleChildScrollView serve
      // para adicionar Scroll
      // ele só funciona quando o componente pai possui
      // tamanho definido
      // neste caso o Scaffold ocupa toda tela
      // portanto ele funciona
      // mas ele poderia funcionar dentro
      // de um container com um height definido
      // por exemplo
      child: SingleChildScrollView(
        child: Column(
          // esticar eixo cruzado
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // if (islandscape)
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('Exibir Gráfico'),
            //     // Switch(
            //     // contrutor nomeado adaptative serve para
            //     // fazer com que o Switch se adapte ao SO
            //     // que está sendo utilizado
            //     // se for IOS ele deixa o Switch no visual do Cuppertino
            //     // caso seja no Android, ele deixa no visual do Material
            //     Switch.adaptive(
            //       value: _showChart,
            //       onChanged: (visibility) {
            //         setState(() => _showChart = visibility);
            //       },
            //     ),
            //   ],
            // ),
            if (!islandscape || _showChart)
              Container(
                height: avaliableHeight * (islandscape ? 0.8 : 0.3),
                child: Chart(_recentTransactions),
              ),
            if (!islandscape || !_showChart)
              Container(
                height: avaliableHeight * (islandscape ? 1 : 0.7),
                child: TransactionList(
                  _transactions,
                  _removeTransaction,
                ),
              ),
          ],
        ),
      ),
    );
    
    return Platform.isAndroid
        ? Scaffold(
            appBar: appBar,
            floatingActionButton: Platform.isAndroid
                ? FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                  )
                : Container(), // no IOS costuma-se não ter floating buttons
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: bodyPage,
          )
        : CupertinoPageScaffold(
            child: bodyPage,
          );
  }
}
