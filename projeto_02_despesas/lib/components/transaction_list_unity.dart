import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionListUnity extends StatefulWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionListUnity({
    Key key,
    this.transaction,
    this.onRemove,
  }) : super(key: key);

  @override
  _TransactionListUnityState createState() => _TransactionListUnityState();
}

class _TransactionListUnityState extends State<TransactionListUnity> {
  final colors = [
    Colors.teal,
    Colors.teal[300],
    Colors.teal[400],
    Colors.teal[600],
    Colors.cyan[800],
  ];

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int random = Random().nextInt(colors.length);
    _backgroundColor = colors[random];
    print('random: ' + random.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(6),
      child: ListTile(
        // leading: Container(
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle
        //   ),
        //   color: Theme.of(context).primaryColor,
        //   height: 60,
        //   width: 60,
        // )
        // o container acima pode ser simmplificado por
        // um CircleAvatar
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                'R\$${widget.transaction.value}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.transaction.id),
                label: const Text('Excluir'),
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.grey,
                onPressed: () => widget.onRemove(widget.transaction.id),
              ),
      ),
    );
  }
}
