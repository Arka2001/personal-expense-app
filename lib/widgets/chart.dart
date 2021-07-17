import 'package:flutter/material.dart';
import '../widgets/bar_chart.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  // ignore: use_key_in_widget_constructors
  // ignore: prefer_const_constructors_in_immutables
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'Amount': totalAmount,
      };
    });
  }

  double get totalSpendings {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Expanded(
          child: Row(
            children: groupedTransactions.map((data) {
              return BarChart(
                label: data['Day'],
                spendAmount: data['Amount'],
                spendPctOfTotal: (data['Amount'] as double) / totalSpendings,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
