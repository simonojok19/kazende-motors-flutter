import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/pages/bodaboda_list_page.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_service.dart';

import 'loan_type_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GridView.extent(
        maxCrossAxisExtent: 175.0,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.motorcycle,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'BodaBodas',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BodaBodaListBlocProvider(
                              bodaBodaListBloc: BodaBodaListBloc(
                                  authenticationApi: AuthenticationService(),
                                  bodaAPI: BodaBodaService()),
                              child: BodaBodaListPage(),
                            )));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'Locations',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.local_parking,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'Stage',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.motorcycle,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'BodaBodas',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.motorcycle,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'BodaBodas',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.all_out,
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  Divider(),
                  Text(
                    'Loan Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => LoanTypeListPage()
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
