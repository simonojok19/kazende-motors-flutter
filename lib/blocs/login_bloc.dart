import 'dart:async';

import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/classes/login_validators.dart';

class LoginBloc with LoginValidators {
  final AuthenticationApi authenticationApi;
  String _email;
  String _password;
  bool _emailValid;
  bool _passwordValid;

  StreamController<String> _emailController =  StreamController<String>.broadcast();
  Sink<String> get emailChnaged => _emailController.sink;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  final StreamController<String> _passwordController = StreamController<String>.broadcast();
  Sink<String> get passwordChanged => _passwordController.sink;
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  final StreamController<bool> _enableLoginCreateButtonController = StreamController<bool>.broadcast();
  Sink<bool> get enableLoginCreateButtonChanged => _enableLoginCreateButtonController.sink;
  Stream<bool> get enableLoginCreateButton => _enableLoginCreateButtonController.stream;

  final StreamController<String> _loginOrCreateButtonController = StreamController<String>();
  Sink<String> get loginOrCreateButtonChanged => _loginOrCreateButtonController.sink;
  Stream<String> get loginOrCreateButton => _loginOrCreateButtonController.stream;

  final StreamController<String> _loginOrCreateController = StreamController<String>();
  Sink<String> get loginOrCreateChanged => _loginOrCreateController.sink;
  Stream<String> get loginOrCreate => _loginOrCreateController.stream;

  LoginBloc({ this.authenticationApi }) {
    _startListenersIfEmailPasswordAreValid();
  }

  void dispose() {
    _passwordController.close();
    _emailController.close();
    _enableLoginCreateButtonController.close();
    _enableLoginCreateButtonController.close();
    _loginOrCreateController.close();
  }

  void _startListenersIfEmailPasswordAreValid() {
    email.listen((email) {
      _email = email;
      _emailValid = true;
      _updateEnableLoginCreateButtonStream();
    }).onError((error) {
      _email = '';
      _emailValid = false;
      _updateEnableLoginCreateButtonStream();
    });

    password.listen((password) {
      _password = password;
      _passwordValid = true;
    }).onError((error) {
      _password = '';
      _passwordValid = false;
    });

    loginOrCreate.listen((action) {
      action == 'Login' ? loginIn() : _createAccount();
    });
  }

  void _updateEnableLoginCreateButtonStream() {
    if (_emailValid == true && _passwordValid == true ) {
      enableLoginCreateButtonChanged.add(true);
    } else {
      enableLoginCreateButtonChanged.add(false);
    }
  }

  Future<String> _createAccount() async {
    String _result = '';
    if (_emailValid == true && _passwordValid == true ) {
      // removed cread user
    }
    return _result;
  }

  Future<String> loginIn() async {
    String _result = '';
    if ( _emailValid == true &&  _passwordValid == true ) {
      await authenticationApi.signInWithEmailAndPassword(email: _email, password: _password).then((user) {
        _result = 'Success';
      }).catchError((error) {
        _result = 'There was error';
        print(error.toString());
      });
    } else {
      _result = 'Email and Password are not valid';
    }
    print(_result);
    return _result;
  }
}