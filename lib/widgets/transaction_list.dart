import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: ListView.builder(
          itemCount: _userTransactions.length,
          itemBuilder: (_, index) {
            return Card(
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Text(
                    '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),

                    //style: TextStyle(color: Colors.white),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userTransactions[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      DateFormat.yMEd().format(_userTransactions[index].date),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )
              ]),
            );
          }),
    );
  }
}
