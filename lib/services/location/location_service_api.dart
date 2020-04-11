import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kazendemotors/models/location/location_model.dart';

abstract class LocationServiceApi {
  Firestore getFirestoreInstance();
  Stream<List<Location>> getLocationList();
  Future<Location> getLocation(String documentID);
  Future<bool> registerLocation(Location location);
  void updateLocation(Location location);
  void updateLocationWithTransaction(Location location);
  void deleteLocation(Location location);
}