import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/location_model.dart';
import 'package:kazendemotors/services/location_service_api.dart';

class LocationService extends LocationServiceApi {
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
    // TODO: implement getLocationList
    return null;
  }

  @override
  Future<Location> registerLocation(Location location) {
    // TODO: implement registerLocation
    return null;
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