import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/loan_list/loan_list_bloc.dart';

class LoanListBlocProvider extends InheritedWidget {
  final LoanListBloc loanListBloc;
  final String bodabodaDocumentID;

  const LoanListBlocProvider({ Key key, Widget child, this.loanListBloc, this.bodabodaDocumentID}): super(key: key, child: child);
  static LoanListBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanListBlocProvider>();
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}