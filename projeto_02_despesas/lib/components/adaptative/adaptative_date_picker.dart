import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChange,
  });

  // no Android na hora de selecionar data usámos uma função
  // que cria um modal para seleção de data
  openAndroidCalendar(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      // executado depois do usuário fechar o datePicker
    ).then((pickedDate) {
      if (pickedDate != null) {
        onDateChange(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // o CupertinoDatePicker precisa estar dentro de um container
      return Container(
        height: 180,
        // no IOS há um componente próprio para selecionar data
        // trata-se do CupertinoDatePicker
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumDate: DateTime(2019),
          maximumDate: DateTime.now(),
          onDateTimeChanged: onDateChange,
        ),
      );
    } else {
      return Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.selectedDate == null
                  ? 'Nenhuma data selecionada!'
                  : 'Data selecionada: ${DateFormat('d/MM/y').format(selectedDate)}',
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text(
                MediaQuery.of(context).size.width > 320
                    ? 'Selecionar Data'
                    : 'Selecionar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => openAndroidCalendar(context),
            ),
          ],
        ),
      );
    }
  }
}
