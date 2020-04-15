import 'dart:async';

import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_api.dart';

class MainPageBloc {
  final BodaBodaAPI bodaBodaAPI;
  StreamController<List<BodaBoda>> _bodaBodaStreamController = StreamController<List<BodaBoda>>.broadcast();
  Sink<List<BodaBoda>> get _addBodaBoda => _bodaBodaStreamController.sink;
  Stream<List<BodaBoda>> get bodaBoda => _bodaBodaStreamController.stream;

  MainPageBloc({ this.bodaBodaAPI }) {
    bodaBodaAPI.getBodaBodaList().listen((bodaBoda) {
      _addBodaBoda.add(bodaBoda);
    });
  }

  void dispose() {
    _bodaBodaStreamController.close();
  }
}