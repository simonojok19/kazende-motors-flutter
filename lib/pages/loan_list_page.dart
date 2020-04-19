import 'package:flutter/material.dart';

class LoanListPage extends StatefulWidget {
  @override
  _LoanListPageState createState() => _LoanListPageState();
}

class _LoanListPageState extends State<LoanListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan List'),),
    );
  }
}
