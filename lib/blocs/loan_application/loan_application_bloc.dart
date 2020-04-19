import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/loan/loan_model.dart';
import 'package:kazendemotors/services/loan/loan_api.dart';

class LoanApplicationBloc {
  final LoanApi loanApi;
  final Loan loan;
  final AuthenticationApi authenticationApi;
  final bool apply;
  final String bodaBodaDocumentID;


  StreamController<String> _amountStreamController = StreamController<String>.broadcast();
  Sink<String> get addAmount => _amountStreamController.sink;
  Stream<String> get amountStream => _amountStreamController.stream;

  StreamController<String> _periodStreamController = StreamController<String>.broadcast();
  Sink<String> get addPeriod => _periodStreamController.sink;
  Stream<String> get periodStream => _periodStreamController.stream;

  StreamController<String> _frequencyStreamController = StreamController<String>.broadcast();
  Sink<String> get addFrequency => _frequencyStreamController.sink;
  Stream<String> get frequencyStream => _frequencyStreamController.stream;

  StreamController<String> _interestRateController = StreamController<String>.broadcast();
  Sink<String> get addInterest => _interestRateController.sink;
  Stream<String> get interestRateStream => _interestRateController.stream;


  void dispose() {
    _amountStreamController.close();
    _periodStreamController.close();
    _frequencyStreamController.close();
    _interestRateController.close();
  }


  LoanApplicationBloc ({ this.loanApi, this.loan, this.authenticationApi, this.apply, this.bodaBodaDocumentID }) {
    authenticationApi.currentUserUid().then((currentUserID) {
      loan.userDocumentID = currentUserID;
      loan.bodabodaDocumentID = bodaBodaDocumentID;
      _startListeners().then((success) {
        _getApplication(apply, loan);
      });
    }).catchError((error) {
      print('There was error getting user: $error');
    });
  }

  Future<bool> _startListeners() async{
    _amountStreamController.stream.listen((amount) {
      loan.amount = amount;
    }).onError((error) {
      print('Error: $error');
    });

    _periodStreamController.stream.listen((period) {
      loan.period = period;
    }).onError((error) {
      print('Error: $error');
    });

    _frequencyStreamController.stream.listen((frequency) {
      loan.frequency = frequency;
    }).onError((error) {
      print('Error: $error');
    });

    _interestRateController.stream.listen((interest) {
      loan.interestRate = interest;
    }).onError((error) {
      print('Error: $error');
    });
    return true;
  }

  void _getApplication(bool apply, Loan loan) {
    if (apply) {
      // default
    } else {
      // copy
    }
  }

  void applyForLoan() {
    loanApi.applyForLoan(loan);
    print(loan.toString());
  }
}
