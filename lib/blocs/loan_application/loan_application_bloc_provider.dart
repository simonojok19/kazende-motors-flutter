import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/loan_application/loan_application_bloc.dart';

class LoanApplicationBlocProvider extends InheritedWidget {
  final LoanApplicationBloc loanApplicationBloc;

  const LoanApplicationBlocProvider({Key key, Widget child, this.loanApplicationBloc}): super(key: key, child: child);

  static LoanApplicationBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanApplicationBlocProvider>();
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}