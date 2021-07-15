import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10),
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Text(
              '\$ ${transaction.amount.toStringAsFixed(2)}',
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.title,
                // ignore: prefer_const_constructors
                style: Theme.of(context).textTheme.headline6,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15.0,
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(transaction.date),
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
