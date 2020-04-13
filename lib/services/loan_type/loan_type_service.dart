import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeService extends LoanTypeApi {
  @override
  Future<bool> addLoanType(LoanType loanType) {
    // TODO: implement addLoanType
    return null;
  }

  @override
  Firestore getInstance() {
    // TODO: implement getInstance
    return null;
  }

  @override
  Future<LoanType> getLoanType(String documentID) {
    // TODO: implement getLoanType
    return null;
  }

  @override
  Stream<List<LoanType>> getLoanTypeList() {
    // TODO: implement getLoanTypeList
    return null;
  }

}