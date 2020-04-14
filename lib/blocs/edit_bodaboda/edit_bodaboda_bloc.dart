import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_api.dart';


class EditBodaBodaBloc {
  final BodaBodaAPI bodaBodaAPI;
  final AuthenticationApi authenticationApi;
  final bool register;
  BodaBoda bodaBoda;

  StreamController<String> _firstNameController =
      StreamController<String>.broadcast();
  Sink<String> get firstNameChanged => _firstNameController.sink;
  Stream<String> get firstName => _firstNameController.stream;

  StreamController<String> _lastNameController = StreamController<String>.broadcast();
  Sink<String> get lastNameChanged => _lastNameController.sink;
  Stream<String> get lastName => _lastNameController.stream;

  StreamController<String> _middleNameController = StreamController<String>.broadcast();
  Sink<String> get middleNameChanged => _middleNameController.sink;
  Stream<String> get middleName => _middleNameController.stream;

  StreamController<String> _dateOfBirthController = StreamController<String>.broadcast();
  Sink<String> get dateOfBirthChanged => _dateOfBirthController.sink;
  Stream<String> get dateOfBirth => _dateOfBirthController.stream;

  StreamController<String> _permitNumberController = StreamController<String>.broadcast();
  Sink<String> get permitNumberChanged => _permitNumberController.sink;
  Stream<String> get permitNumber => _permitNumberController.stream;

  StreamController<String> _stageIDController = StreamController<String>.broadcast();
  Sink<String> get stageIDChanged => _stageIDController.sink;
  Stream<String> get stageID => _stageIDController.stream;


  StreamController<String> _locationIDController = StreamController<String>.broadcast();
  Sink<String> get locationIDChanged => _locationIDController.sink;
  Stream<String> get locationID => _locationIDController.stream;

  StreamController<String> _motorcycleIDController = StreamController<String>.broadcast();
  Sink<String> get motorcycleIDChanged => _motorcycleIDController.sink;
  Stream<String> get motorcycleID => _motorcycleIDController.stream;

  EditBodaBodaBloc({this.register, this.bodaBoda, this.bodaBodaAPI, this.authenticationApi}) {
    authenticationApi.currentUserUid().then((userID) {
      bodaBoda.userId = userID;
      _startEditListenter().then((finished) => _getJournal(register, bodaBoda));
    }).catchError((error) {
      print('There was error get userID: $error');
    });
  }

  void dispose() {
    _firstNameController.close();
    _lastNameController.close();
    _middleNameController.close();
    _dateOfBirthController.close();
    _permitNumberController.close();
    _stageIDController.close();
    _locationIDController.close();
    _motorcycleIDController.close();
  }

  Future<bool> _startEditListenter() async {
    _firstNameController.stream.listen((firstName) {
      bodaBoda.firstName = firstName;
      print(firstName);
    });

    _lastNameController.stream.listen((lastName) {
      bodaBoda.lastName = lastName;
      print(bodaBoda.lastName);
    });

    _middleNameController.stream.listen((middleName) {
      bodaBoda.middleName = middleName;
      print(bodaBoda.middleName);
    });

    _dateOfBirthController.stream.listen((dateOfBirth) {
      bodaBoda.dateOfBirth = dateOfBirth;
      print(dateOfBirth);
    });

    _permitNumberController.stream.listen((permitNumber) {
      bodaBoda.permitNumber = permitNumber;
      print(permitNumber);
    });

    _stageIDController.stream.listen((stageID) {
      bodaBoda.stageID = stageID;
      print(stageID);
    });

    _locationIDController.stream.listen((locationID) {
      bodaBoda.locationID = locationID;
      print(locationID);
    });

    _motorcycleIDController.stream.listen((motorcycleID) {
      bodaBoda.motorcycleID = motorcycleID;
      print(motorcycleID);
    });

    return true;
  }

  void _getJournal(bool register, BodaBoda bodaboda) {
    if (register) {
      bodaBoda = BodaBoda();
      bodaBoda.firstName = '';
      bodaBoda.lastName = '';
    } else {
      bodaBoda.firstName = bodaboda.firstName;
    }
    firstNameChanged.add(bodaBoda.firstName);
  }

  void saveBodaBoda() {
    // BodaBoda bodaboda = BodaBoda(
    //     documentID: bodaBoda.documentID, firstName: bodaBoda.firstName);
    // register
    //     ? bodaBodaAPI.registerBodaBoda(bodaboda)
    //     : bodaBodaAPI.updateBodaBoda(bodaboda);
    bodaBodaAPI.registerBodaBoda(bodaBoda);
    print(bodaBoda.toString());
  }
}
