import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc_provider.dart';

class LoanApplicationPage extends StatefulWidget {
  @override
  _LoanApplicationPageState createState() => _LoanApplicationPageState();
}

class _LoanApplicationPageState extends State<LoanApplicationPage> {
  LoanApplicationBloc _loanApplicationBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loanApplicationBloc = LoanApplicationBlocProvider.of(context).loanApplicationBloc;
  }


  @override
  void dispose() {
    _loanApplicationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply For Loan'),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
