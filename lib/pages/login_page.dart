import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/login_bloc.dart';
import 'package:kazendemotors/classes/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;

  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationApi: AuthenticationService());
  }

  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottom: PreferredSize(
      //     child: Icon(
      //       Icons.account_circle,
      //       size: 88.0,
      //       color: Colors.white,
      //     ),
      //     preferredSize: Size.fromHeight(50.0),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 100.0,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              StreamBuilder(
                stream: _loginBloc.email,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      icon: Icon(Icons.mail_outline),
                      errorText: snapshot.error),
                  onChanged: _loginBloc.emailChnaged.add,
                ),
              ),
              StreamBuilder(
                stream: _loginBloc.password,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.security),
                      errorText: snapshot.error),
                  onChanged: _loginBloc.passwordChanged.add,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              StreamBuilder(
                initialData: false,
                stream: _loginBloc.enableLoginCreateButton,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    RaisedButton(
                  elevation: 16.0,
                  child: Text('Login'),
                  color: Colors.lightBlue.shade200,
                  disabledColor: Colors.grey.shade100,
                  onPressed: () { _loginBloc.loginIn(); },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
