import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc_provider.dart';

class LoanTypeEditPage extends StatefulWidget {
  @override
  _LoanTypeEditPageState createState() => _LoanTypeEditPageState();
}

class _LoanTypeEditPageState extends State<LoanTypeEditPage> {
  LoanTypeEditBloc _loanTypeEditBloc;


  @override
  void dispose() {
    _loanTypeEditBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Loan Type'),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _createTextField(
                labelText: 'Name',
                stream: _loanTypeEditBloc.name,
                sink: _loanTypeEditBloc.nameChanged,
                icon: Icon(Icons.edit)
              ),
              _createTextField(
                labelText: 'Payment Period',
                stream: _loanTypeEditBloc.payment,
                sink: _loanTypeEditBloc.paymentChanged,
                icon: Icon(Icons.attach_money)
              ),
              _createTextField(
                labelText: 'Item',
                stream: _loanTypeEditBloc.item,
                sink: _loanTypeEditBloc.itemChanged,
                icon: Icon(Icons.motorcycle)
              ),
              _createTextField(
                labelText: 'Quantity',
                stream: _loanTypeEditBloc.quantity,
                sink: _loanTypeEditBloc.quantityChanged,
                icon: Icon(Icons.account_balance)
              ),
              _createTextField(
                labelText: 'Description',
                stream: _loanTypeEditBloc.description,
                sink: _loanTypeEditBloc.descriptionChanged,
                icon: Icon(Icons.edit)
              ),
              RaisedButton(
                child: Text('Save Changes'),
                onPressed: _loanTypeEditBloc.saveLoanType,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTextField(
      {Stream stream, String labelText, Icon icon, Sink<String> sink}) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: labelText, icon: icon, errorText: snapshot.error),
        onChanged: sink.add,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loanTypeEditBloc = LoanTypeEditBlocProvider.of(context).loanTypeEditBloc;

  }
}
