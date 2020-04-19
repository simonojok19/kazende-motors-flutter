import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/loan/loan_model.dart';
import 'package:kazendemotors/models/type/loan_type_model.dart';
import 'package:kazendemotors/services/loan/loan_api.dart';

class LoanService implements LoanApi {
  Firestore _firestore = Firestore.instance;
  String _collection = 'loans';

  @override
  Future<bool> applyForLoan(Loan loan) async {
    DocumentReference documentReference = await _firestore.collection(_collection)
    .add(Loan.createDocumentFromLoan(loan));
    return documentReference.documentID != null;
  }

  @override
  Future<Loan> getLoanByID(String documentID) {
    // TODO: implement getLoanByID
    return null;
  }

  @override
  Stream<List<Loan>> getLoanList(String bodabodaID) {
    return _firestore.collection(_collection).where('bodabodaDocumentID', isEqualTo: bodabodaID).snapshots()
        .map((QuerySnapshot snapshot) {
          List<Loan> _loans = snapshot.documents.map((doc) => Loan.createLoanFromDocument(doc)).toList();
          return _loans;
    });
  }

}