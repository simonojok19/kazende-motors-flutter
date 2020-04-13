import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/type_list/loan_type_list_bloc.dart';

class LoanTypeListBlocProvider extends InheritedWidget {
  final LoanTypeListBloc loanTypeListBloc;

  const LoanTypeListBlocProvider({ Key key, Widget child, this.loanTypeListBloc }): super(key: key, child: child);

  static LoanTypeListBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanTypeListBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}