import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc.dart';
import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeEditBlocProvider extends InheritedWidget {
  final LoanTypeEditBloc loanTypeEditBloc;

  const LoanTypeEditBlocProvider({ Key key, Widget child, this.loanTypeEditBloc}): super(key: key, child: child);

  static LoanTypeEditBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanTypeEditBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}

