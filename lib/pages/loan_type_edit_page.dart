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
    return Container();
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
