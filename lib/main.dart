import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentcation_bloc_provider.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/blocs/main_page/main_page_bloc.dart';
import 'package:kazendemotors/blocs/main_page/main_page_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/pages/home_page.dart';
import 'package:kazendemotors/pages/login_page.dart';
import 'package:kazendemotors/pages/main_page.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_service.dart';

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
            return _buildMaterialApp(homePage: HomePage());
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
          primarySwatch: Colors.blueGrey[900],
          canvasColor: Colors.blueGrey[700],
      ),
      home: MainPageBlocProvider(
        child: MainPage(),
        mainPageBloc: MainPageBloc(
          bodaBodaAPI: BodaBodaService()
        ),
      ),
    );
  }
}
