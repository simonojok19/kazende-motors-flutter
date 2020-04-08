import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentcation_bloc_provider.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/pages/bodaboda_page.dart';
import 'package:kazendemotors/pages/contact_page.dart';
import 'package:kazendemotors/pages/home_page.dart';
import 'package:kazendemotors/pages/login_page.dart';
import 'package:kazendemotors/pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
        AuthenticationService();
    final AuthenticationBloc _authenticationBloc =
        AuthenticationBloc(_authenticationService);

    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
        initialData: null,
        stream: _authenticationBloc.user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.orangeAccent,
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return _buildMaterialApp(homePage: BodaBodaRegistrationPage());
          } else return _buildMaterialApp(homePage: LoginPage());
        },
      ),
    );
  }

  MaterialApp _buildMaterialApp({Widget homePage}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kazende Motors',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          canvasColor: Colors.lightBlue.shade200,
          bottomAppBarColor: Colors.orange.shade900),
      home: homePage,
    );
  }
}
