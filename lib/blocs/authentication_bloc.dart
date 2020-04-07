
import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';

class AuthenticationBloc {
  final AuthenticationApi authenticationApi;

  final StreamController<String> _authenticationStreamController = StreamController<String>();
  Sink<String> get authenticationSink => _authenticationStreamController.sink;
  Stream<String> get authenticationStream => _authenticationStreamController.stream;

  final StreamController<bool> _logoutStreamController = StreamController<bool>();
  Sink<bool> get logoutSink => _logoutStreamController.sink;
  Stream<bool> get logoutStream => _logoutStreamController.stream;

  AuthenticationBloc({ this.authenticationApi }) {
    onAuthChanged();
  }

  void dispose() {
    _authenticationStreamController.close();
    _logoutStreamController.close();
  }

  void onAuthChanged() {
    authenticationApi.getFirebaseAuth()
    .onAuthStateChanged.listen((user) {
      final String uid = user != null ? user.uid : null;
      authenticationSink.add(uid);
    });

    _logoutStreamController.stream.listen((logout) {
      if (logout == true ) {
        _signOut();
      }
    });
  }

  void _signOut() {
    authenticationApi.signOut();
  }
}