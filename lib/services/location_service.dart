import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/location_model.dart';
import 'package:kazendemotors/services/location_service_api.dart';

class LocationService extends LocationServiceApi {
  Firestore _firestore = Firestore.instance;
  String _collection = 'location';

  LocationService() {
    _firestore.settings(persistenceEnabled: true);
  }

  @override
  void deleteLocation(Location location) {
    // TODO: implement deleteLocation
  }

  @override
  Firestore getFirestoreInstance() {
    // TODO: implement getFirestoreInstance
    return null;
  }

  @override
  Future<Location> getLocation(String documentID) {
    // TODO: implement getLocation
    return null;
  }

  @override
  Stream<List<Location>> getLocationList() {
    return _firestore
    .collection(_collection)
    .snapshots()
    .map((QuerySnapshot snapshot) {
      List<Location> _location = snapshot
      .documents.map((doc) => Location.createLocationFromDocument(doc)).toList();
      return _location;
    });
  }

  @override
  Future<bool> registerLocation(Location location) async {
    DocumentReference _documentReference = await _firestore
    .collection(_collection).add(
      Location.createDocumentFromLocation(location)
    );
    return _documentReference.documentID != null;
  }

  @override
  void updateLocation(Location location) {
    // TODO: implement updateLocation
  }

  @override
  void updateLocationWithTransaction(Location location) {
    // TODO: implement updateLocationWithTransaction
  }
  
}