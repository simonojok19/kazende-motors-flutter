import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';

class AuthenticationBloc {
  final AuthenticationApi authenticationApi;

  final StreamController<String> _authenticationController =
      StreamController<String>();
  Sink<String> get addUser => _authenticationController.sink;
  Stream<String> get user => _authenticationController.stream;

  final StreamController<bool> _logoutContoller = StreamController<bool>();
  Sink<bool> get logoutUser => _logoutContoller.sink;
  Stream<bool> get listLogoutUser => _logoutContoller.stream;

  AuthenticationBloc(this.authenticationApi) {
    onAuthChanged();
  }

  void onAuthChanged() {
    authenticationApi.getFirebaseAuth().onAuthStateChanged.listen((user) {
      final String uid = user != null ? user.uid : null;
      addUser.add(uid);
    });
    _logoutContoller.stream.listen((logout) {
      if (logout == true) {
        signOut();
      }
    });
  }

  void dispose() {
    _authenticationController.close();
    _logoutContoller.close();
  }

  void signOut() {
    authenticationApi.signOut();
  }
}
