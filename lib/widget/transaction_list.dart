import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 3,
              child: Row(
                children: [
                  Container(
                    width: 140,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Rs. ${transactions[index].price.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(25.0)),
                    margin: EdgeInsets.all(10.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        DateFormat("d MMMM y").format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
