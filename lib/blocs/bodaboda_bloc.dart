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

  BodaBodaBloc({this.register, this.bodaBoda, this.bodaBodaAPI}) {
    _startEditListenter().then((finished) => _getJournal(register, bodaBoda));
  }

  void dispose() {
    _firstNameController.close();
  }

  Future<bool> _startEditListenter() async {
    _firstNameController.stream.listen((firstName) {
      bodaBoda.firstName = firstName;
    });
    return true;
  }

  void _getJournal(bool register, BodaBoda bodaboda) {
    if (register) {
      bodaBoda = BodaBoda();
      bodaBoda.firstName = '';
    } else {
      bodaBoda.firstName = bodaboda.firstName;
    }
    firstNameChanged.add(bodaBoda.firstName);
  }

  void _saveBodaBoda() {
    BodaBoda bodaboda = BodaBoda(
        documentID: bodaBoda.documentID, firstName: bodaBoda.firstName);
    register
        ? bodaBodaAPI.registerBodaBoda(bodaBoda)
        : bodaBodaAPI.updateBodaBoda(bodaBoda);
  }
}
