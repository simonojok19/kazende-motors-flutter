import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentcation_bloc_provider.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/classes/authentication.dart';
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
        AuthenticationBloc(authenticationApi: _authenticationService);

    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
        initialData: null,
        stream: _authenticationBloc.user,
      ),
    );
  }

  MaterialApp _buildMaterialApp({Widget homePage}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security Inherited',
      theme: ThemeData(
          primarySwatch: Colors.orange.shade900,
          canvasColor: Colors.orange.shade200,
          bottomAppBarColor: Colors.orange.shade900),
      home: homePage,
    );
  }
}
