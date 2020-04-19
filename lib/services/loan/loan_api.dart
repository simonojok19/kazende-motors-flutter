import 'package:kazendemotors/models/loan/loan_model.dart';

abstract class LoanApi {
  Stream<List<Loan>> getLoanList(String bodabodaID);
  Future<Loan> getLoanByID(String documentID);
  Future<bool> applyForLoan(Loan loan);
}