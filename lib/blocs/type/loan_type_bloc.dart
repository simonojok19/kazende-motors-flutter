import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeBloc {
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
}