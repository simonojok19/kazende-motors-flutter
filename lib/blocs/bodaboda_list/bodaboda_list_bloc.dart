import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_api.dart';

class BodaBodaListBloc {
  final BodaBodaAPI bodaAPI;
  final AuthenticationApi authenticationApi;

  final StreamController<List<BodaBoda>> _bodabodaListController = StreamController<List<BodaBoda>>.broadcast();
  Sink<List<BodaBoda>> get _addBodaBodaList => _bodabodaListController.sink;
  Stream<List<BodaBoda>> get listBodaBoda => _bodabodaListController.stream;

  BodaBodaListBloc({  this.bodaAPI, this.authenticationApi }) {
    _startListeners();
  }

  void dispose() {
    _bodabodaListController.close();
  }

  void _startListeners() {
    authenticationApi.getFirebaseAuth().currentUser().then((user) {
      bodaAPI.getBodaBodaList().listen((bodabodas) {
        _addBodaBodaList.add(bodabodas);
      });
    });
  }

}