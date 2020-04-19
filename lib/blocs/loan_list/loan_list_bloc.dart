import 'dart:async';

import 'package:kazendemotors/models/loan/loan_model.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_api.dart';
import 'package:kazendemotors/services/loan/loan_api.dart';

class LoanListBloc {
  LoanApi loanApi;
  String bodaBodaDocumentID;
  final StreamController<List<Loan>> _stream = StreamController<List<Loan>>.broadcast();
  Sink<List<Loan>> get _addLoan => _stream.sink;
  Stream<List<Loan>> get loanStream => _stream.stream;

  LoanListBloc({ this.loanApi, this.bodaBodaDocumentID }) {
    _startListeners();
  }

  void dispose() {
    _stream.close();
  }

  void _startListeners() {
    loanApi.getLoanList(bodaBodaDocumentID).listen((bodaboda) {
      _addLoan.add(bodaboda);
    });
  }
}