import './widget/new_transaction.dart';
import './widget/transaction_list.dart';
import './model/Transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(id: '1', name: 'Shoes', date: DateTime.now(), price: 500.0),
    Transaction(id: '2', name: 'Mobile', date: DateTime.now(), price: 10000.0),
    Transaction(id: '3', name: 'Laptop', date: DateTime.now(), price: 40000.0),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final Transaction newTx = Transaction(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        name: txTitle,
        price: txAmount);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewtraction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewtraction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [TransactionList(transactions: _userTransaction)],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewtraction(context),
        ),
      ),
    );
  }
}
