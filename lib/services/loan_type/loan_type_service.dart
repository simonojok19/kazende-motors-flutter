import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan_type/loan_type_api.dart';

class LoanTypeService extends LoanTypeApi {
  String _collection = 'loanTypes';
  @override
  Future<bool> addLoanType(LoanType loanType) async {
    DocumentReference _docRef = await getInstance().collection(_collection).add(LoanType.createDocumentFromLoanType(loanType));
    return _docRef.documentID != null;
  }

  @override
  Firestore getInstance() {
    return Firestore.instance;
  }

  @override
  Future<LoanType> getLoanType(String documentID) {
    // TODO: implement getLoanType
    return null;
  }

  @override
  Stream<List<LoanType>> getLoanTypeList() {
    return getInstance().collection(_collection).snapshots().map((QuerySnapshot snapshot) {
      List<LoanType> list = snapshot.documents.map((doc) => LoanType.createLoanTypeFromDoc(doc)).toList();
      return list;
    });
  }

}