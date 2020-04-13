import 'package:flutter/cupertino.dart';
import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeBlocProvider extends InheritedWidget {
  final AuthenticationApi authenticationApi;
  final LoanTypeApi loanTypeApi;

  const LoanTypeBlocProvider({ Key key, Widget child, this.authenticationApi, this.loanTypeApi}): super(key: key, child: child);

  static LoanTypeBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoanTypeBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
  }

}

