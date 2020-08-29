import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './transaction_list_unity.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    // ListView é uma lista com Scroll
    // deve ter pai com tamanho definido
    // renderiza todos os elementos
    // mesmo que eles não sejam exibidos
    // o que ocupa muita RAM do celular
    // se a lista for muito grande

    // para listas grandes
    // ListView pode ser substituido por
    // ListView.builder

    // é um construtor alternativo de ListView
    // para contornar esse problema
    // nele o conteúdo vai sendo renderizado
    // sob demanda
    // ou seja, é carregado enquanto o usuário
    // faz o scroll

    // no ListView temos o children
    // no ListView.builder temos o itemCount
    // e o itemBuilder que é uma callback
    // que recebe ctx e index
    // e deve retornar uma unidade
    // que representa os itens da lista
    if (transactions.isNotEmpty)
      return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return TransactionListUnity(
            transaction: tr, 
            onRemove: removeTransaction,
            key: GlobalObjectKey(tr),
          );
        },
      );
      
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            'Nenhuma Transação Cadastrada',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          Container(
            height: constraints.maxHeight * 0.5,
            child: Image.asset(
              'assets\\images\\waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
