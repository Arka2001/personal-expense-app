import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPctOfTotal;

  BarChart({this.label, this.spendAmount, this.spendPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${spendAmount.toStringAsFixed(0)}'),
        const SizedBox(
          height: 4,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
