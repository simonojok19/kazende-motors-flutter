import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentcation_bloc_provider.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc_provider.dart';

class BodaBodaListPage extends StatefulWidget {
  @override
  _BodaBodaListPageState createState() => _BodaBodaListPageState();
}

class _BodaBodaListPageState extends State<BodaBodaListPage> {
  AuthenticationBloc _authenticationBloc;
  BodaBodaListBloc _bodaBodaListBloc;
  String _uid;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authenticationBloc = AuthenticationBlocProvider.of(context).authenticationBloc;
    _bodaBodaListBloc = BodaBodaListBlocProvider.of(context).bodaBodaListBloc;
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    _bodaBodaListBloc.dispose();
     super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boda Bodas'),
      ),
      body: StreamBuilder(
        stream: _bodaBodaListBloc.listBodaBoda,
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.connectionState == ConnectionState.waiting ) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildBodaBodaCards() {
    return Card(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/image_simon.jpg'),
            radius: 50.0,
          ),
          Text(
            'Simon Peter Ojok',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodaBodaCard() {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/image_simon.jpg'),
                    radius: 50.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Simon Peter Ojok',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () { },
      ),
    );
  }
}
