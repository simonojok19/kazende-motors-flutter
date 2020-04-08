import 'dart:async';

import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/services/bodaboda_api.dart';

class BodaBodaBloc {
  final BodaBodaAPI bodaBodaAPI;
  final bool register;
  BodaBoda bodaBoda;

  StreamController<String> _firstNameController =
      StreamController<String>.broadcast();
  Sink<String> get firstNameChanged => _firstNameController.sink;
  Stream<String> get firstName => _firstNameController.stream;

  StreamController<String> _lastNameController = StreamController<String>.broadcast();
  Sink<String> get lastNameChanged => _lastNameController.sink;
  Stream<String> get lastName => _lastNameController.stream;

  BodaBodaBloc({this.register, this.bodaBoda, this.bodaBodaAPI}) {
    _startEditListenter().then((finished) => _getJournal(register, bodaBoda));
  }

  void dispose() {
    _firstNameController.close();
    _lastNameController.close();
  }

  Future<bool> _startEditListenter() async {
    _firstNameController.stream.listen((firstName) {
      bodaBoda.firstName = firstName;
      print(firstName);
    });

    _lastNameController.stream.listen((lastName) {
      bodaBoda.lastName = lastName;
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

  void _saveBodaBoda() {
    BodaBoda bodaboda = BodaBoda(
        documentID: bodaBoda.documentID, firstName: bodaBoda.firstName);
    register
        ? bodaBodaAPI.registerBodaBoda(bodaboda)
        : bodaBodaAPI.updateBodaBoda(bodaboda);
  }
}
