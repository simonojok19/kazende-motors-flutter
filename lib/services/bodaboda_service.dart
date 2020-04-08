import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/services/bodaboda_api.dart';

class BodaBodaService implements BodaBodaAPI {
  Firestore _firestore = Firestore.instance;
  String _colloction = "bodaboda";

  BodaBodaService() {
    _firestore.settings(persistenceEnabled: true);
  }

  @override
  void deleteBodaBoda(BodaBoda bodaBoda) async {
    await _firestore
        .collection(_colloction)
        .document(bodaBoda.documentID)
        .delete()
        .catchError((error) => print('Error deleting: $error'));
  }

  @override
  Future<BodaBoda> getBodaBoda(String documentID) {
    // TODO: implement getBodaBoda
    return null;
  }

  @override
  Stream<List<BodaBoda>> getBodaBodaList() {
    return _firestore
        .collection(_colloction)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<BodaBoda> _bodaboda = snapshot.documents
          .map((doc) => BodaBoda.createBodaBodaFromDocument(doc))
          .toList();
      return _bodaboda;
    });
  }

  @override
  Future<bool> registerBodaBoda(BodaBoda bodaBoda) async {
    DocumentReference _documentReference = await _firestore
        .collection(_colloction)
        .add(BodaBoda.createDocumentFromBodaBoda(bodaBoda));
    return _documentReference.documentID != null;
  }

  @override
  void updateBodaBoda(BodaBoda bodaBoda) async {
    await _firestore
        .collection(_colloction)
        .document(bodaBoda.documentID)
        .updateData(BodaBoda.createDocumentFromBodaBoda(bodaBoda))
        .catchError((error) => print('Error updating: $error'));
  }

  @override
  void updateBodaBodaWithTransaction(BodaBoda bodaBoda) {
    // TODO: implement updateBodaBodaWithTransaction
  }
}
