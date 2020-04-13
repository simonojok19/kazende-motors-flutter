import 'package:flutter/material.dart';

class LoanTypeListPage extends StatefulWidget {
  @override
  _LoanTypeListPageState createState() => _LoanTypeListPageState();
}

class _LoanTypeListPageState extends State<LoanTypeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan Types'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
