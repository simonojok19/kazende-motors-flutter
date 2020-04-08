import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/bodboda_model.dart';

abstract class BodaBodaAPI {
  Stream<List<BodaBoda>> getBodaBodaList();
  Future<BodaBoda> getBodaBoda(String documentID);
  Future<bool> registerBodaBoda(BodaBoda bodaBoda);
  void updateBodaBoda(BodaBoda bodaBoda);
  void updateBodaBodaWithTransaction(BodaBoda bodaBoda);
  void deleteBodaBoda(BodaBoda bodaBoda);
}