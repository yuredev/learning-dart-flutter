import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './day_report.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  /// retorna verdadeiro se os DateTimes passados representam
  /// o mesmo dia
  bool _daysAreEqual(DateTime comparable, DateTime comparator) {
    bool sameDay = comparable.day == comparator.day;
    bool sameMonth = comparable.month == comparator.month;
    bool sameYear = comparable.year == comparator.year;
    return sameDay && sameMonth && sameYear;
  }

  String _translateDayToPortuguese(dayInEnlish) {
    Map<String, String> portugueseTranslations = {
      'Mon': 'Seg',
      'Tue': 'Ter',
      'Wed': 'Qua',
      'Thu': 'Qui',
      'Fri': 'Sex',
      'Sat': 'Sáb',
      'Sun': 'Dom'
    };
    return portugueseTranslations[dayInEnlish];
  }

  /// retorna uma lista dos totais gastos nos últimos 7 dias
  /// onde cada elemento da lista é um Set que contém
  /// day: que representa o dia
  /// e value que representa o total gasto
  List<Map<String, Object>> get weekTransactionsReport {
    // List.generate retorna uma lista
    return List.generate(7, (index) {
      final currentWeekDay = DateTime.now().subtract(Duration(days: 6 - index));

      /// salva a inicial do dia da semana ex: se for monday, a variável será 'm' se wednessday será 'w'.
      final dayInEnglish = DateFormat.E().format(currentWeekDay);
      final dayInPortuguese = _translateDayToPortuguese(dayInEnglish);

      // recebe o gasto total do dia a ser iterado
      double dayTotalSum = recentTransactions.where((tr) {
        return _daysAreEqual(currentWeekDay, tr.date);
      }).fold(0, (acc, curr) => acc + curr.value);

      return {'day': dayInPortuguese, 'value': dayTotalSum};
    });
  }

  double get _toalWeekSpent {
    // equivale ao reduce do js
    // porém o valor inicial é o primeiro parametro
    // ao invés do último
    return weekTransactionsReport.fold(0.0, (acc, curr) {
      return acc + curr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekTransactionsReport.map((dayReport) {
            return Expanded(
              child: DayReport(
                label: dayReport['day'],
                value: dayReport['value'],
                percentage: _toalWeekSpent == 0
                    ? 0
                    : (dayReport['value'] as double) / _toalWeekSpent,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
