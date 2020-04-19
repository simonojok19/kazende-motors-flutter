import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
                StreamBuilder(
                  stream: _loanApplicationBloc.amountStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Loan Amount',
                      errorText: snapshot.error
                    ),
                    onChanged: _loanApplicationBloc.addAmount.add,
                  ),
                ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _loanApplicationBloc.periodStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Period in Days',
                    errorText: snapshot.error
                  ),
                  onChanged: _loanApplicationBloc.addPeriod.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _loanApplicationBloc.frequencyStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Frequency',
                    errorText: snapshot.error
                  ),
                  onChanged: _loanApplicationBloc.addFrequency.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _loanApplicationBloc.interestRateStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Interest Rate',
                    errorText: snapshot.error
                  ),
                  onChanged: _loanApplicationBloc.addInterest.add,
                ),
              ),
              RaisedButton(
                child: Text('Apply'),
                onPressed: () { _loanApplicationBloc.applyForLoan();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
