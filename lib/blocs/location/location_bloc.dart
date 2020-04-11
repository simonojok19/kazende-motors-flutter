import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/location/location_model.dart';
import 'package:kazendemotors/services/location/location_api.dart';

class LocationBloc {
  final LocationApi locationApi;
  final AuthenticationApi authenticationApi;
  final bool register;
  Location location;

  StreamController<String> _districtStreamController =
      StreamController<String>.broadcast();
  Sink<String> get districtChanged => _districtStreamController.sink;
  Stream<String> get district => _districtStreamController.stream;

  StreamController<String> _subCountyStreamController =
      StreamController<String>.broadcast();
  Sink<String> get subCountyChanged => _subCountyStreamController.sink;
  Stream<String> get subCounty => _subCountyStreamController.stream;

  StreamController<String> _villageStreamController =
      StreamController<String>.broadcast();
  Sink<String> get villageChanged => _villageStreamController.sink;
  Stream<String> get village => _villageStreamController.stream;

  LocationBloc(
      {this.register,
      this.location,
      this.locationApi,
      this.authenticationApi}) {
    authenticationApi.currentUserUid().then((userID) {
      location.userID = userID;
      _startEditListenter()
          .then((finished) => _getLocation(register, location));
    }).catchError((error) {
      print('There was error getting userID: $error');
    });
  }

  void dispose() {
    _districtStreamController.close();
    _subCountyStreamController.close();
    _villageStreamController.close();
  }

  Future<bool> _startEditListenter() async {
    _districtStreamController.stream.listen((district) {
      location.district = district;
    });

    _subCountyStreamController.stream.listen((subCounty) {
      location.subCounty = subCounty;
    });

    _villageStreamController.stream.listen((village) {
      location.village = village;
    });

    return true;
  }

  void _getLocation(bool register, Location loc) {
    if (register) {
      location.district = '';
      location.village = '';
      location.subCounty = '';
    } else {
      location.district = loc.district;
      location.village = loc.village;
      location.subCounty = loc.subCounty;
    }
  }

  void saveLocation() {
    locationApi.registerLocation(location);
    print(location.toString());
  }
}
