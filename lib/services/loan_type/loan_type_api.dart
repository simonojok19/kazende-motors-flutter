import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';

abstract class LoanTypeApi {
  Firestore getInstance();
  Stream<List<LoanType>> getLoanTypeList();
  Future<LoanType> getLoanType(String documentID);
  Future<bool> addLoanType(LoanType loanType);
}