import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeEditBloc {
  final LoanTypeApi loanTypeApi;
  final AuthenticationApi authenticationApi;
  final bool add;
  LoanType loanType;

  StreamController<String> _nameStreamController = StreamController<String>.broadcast();
  Sink<String> get nameChanged => _nameStreamController.sink;
  Stream<String> get name => _nameStreamController.stream;

  StreamController<String> _paymentStreamController =
  StreamController<String>.broadcast();
  Sink<String> get paymentChanged => _paymentStreamController.sink;
  Stream<String> get payment => _paymentStreamController.stream;

  StreamController<String> _itemStreamController =
  StreamController<String>.broadcast();
  Sink<String> get itemChanged => _itemStreamController.sink;
  Stream<String> get item => _itemStreamController.stream;

  StreamController<String> _quantityStreamController =
  StreamController<String>.broadcast();
  Sink<String> get quantityChanged => _quantityStreamController.sink;
  Stream<String> get quantity => _quantityStreamController.stream;

  StreamController<String> _descriptionStreamController =
  StreamController<String>.broadcast();
  Sink<String> get descriptionChanged => _descriptionStreamController.sink;
  Stream<String> get description => _descriptionStreamController.stream;

  LoanTypeEditBloc({ this.add, this.loanType, this.authenticationApi, this.loanTypeApi}) {
    authenticationApi.currentUserUid().then((userID) {
      loanType.userID = userID;
      _startListener().then((started) {
        _getLoanType(add, loanType);
      });
    }).catchError((error) {
      print('There was error in getting current user: $error');
    });
  }

  void dispose() {
    _descriptionStreamController.close();
    _itemStreamController.close();
    _nameStreamController.close();
    _paymentStreamController.close();
    _quantityStreamController.close();
  }

  Future<bool> _startListener() async {
    _descriptionStreamController.stream.listen((description) {
      loanType.description = description;
    });

    _itemStreamController.stream.listen((item) {
      loanType.item = item;
    });

    _nameStreamController.stream.listen((name) {
      loanType.name = name;
    });

    _quantityStreamController.stream.listen((quantity) {
      loanType.quantity = quantity;
    });

    return true;
  }

  void _getLoanType(bool add, LoanType lt) {
    if (add) {
      loanType.quantity = '';
      loanType.name = '';
      loanType.description = '';
      loanType.updated = '';
      loanType.item = '';
      loanType.created = '';
      loanType.paymentPeriod = '';
    } else {
      loanType.quantity = lt.quantity;
      loanType.name = lt.name;
      loanType.description = lt.description;
      loanType.updated = lt.updated;
      loanType.item = lt.item;
      loanType.created = lt.created;
      loanType.paymentPeriod = lt.paymentPeriod;
    }
  }

  void saveLoanType() {
    loanTypeApi.addLoanType(loanType);
    print(loanType.toString());
  }
}