import 'package:flutter/material.dart';
import 'package:personal_planner/models/transaction.dart';
import 'package:personal_planner/widgets/new_transaction.dart';

import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'abebe',
      title: "Grocery",
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'ayele',
      title: "Shoe",
      amount: 600,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'Kebede',
      title: "Inventory",
      amount: 400,
      date: DateTime.now(),
    )
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    Transaction newTx = new Transaction(
        amount: txAmount,
        title: txTitle,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(200, 0, 16, 32),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
        title: Text(
          'Personal Planner',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.red,
                elevation: 5,
                child: Text("CHART"),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
