import 'package:flutter/material.dart';
import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeEditBlocProvider extends InheritedWidget {
  final AuthenticationApi authenticationApi;
  final LoanTypeApi loanTypeApi;

  const LoanTypeEditBlocProvider({ Key key, Widget child, this.authenticationApi, this.loanTypeApi}): super(key: key, child: child);

  static LoanTypeEditBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanTypeEditBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}

