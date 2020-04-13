import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeListBloc {
  final LoanTypeApi loanTypeApi;
  final AuthenticationApi authenticationApi;

  final StreamController<List<LoanType>> _loanTypeStreamController =
      StreamController<List<LoanType>>.broadcast();
  Sink<List<LoanType>> get _addLoanType => _loanTypeStreamController.sink;
  Stream<List<LoanType>> get loanTypeList => _loanTypeStreamController.stream;

  LoanTypeListBloc({ this.loanTypeApi, this.authenticationApi }) {
    _startListeners();
  }

  void dispose() {
    _loanTypeStreamController.close();
  }

  void _startListeners () {
    authenticationApi.getFirebaseAuth().currentUser().then((user) {
      loanTypeApi.getLoanTypeList().listen((loanTypeList) {
        _addLoanType.add(loanTypeList);
      });
    });
  }
}