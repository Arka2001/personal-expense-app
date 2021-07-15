import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String, double) addNewTransaction;
  // ignore: use_key_in_widget_constructors
  const NewTransaction({@required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextButton(
              onPressed: () => submitTransaction(),
              // ignore: prefer_const_constructors
              child: Text(
                'Add Transaction',
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.indigoAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
