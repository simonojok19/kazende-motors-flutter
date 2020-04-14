import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/authentcation_bloc_provider.dart';
import 'package:kazendemotors/blocs/authentication_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc_provider.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/pages/edit_bodaboda_page.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_service.dart';

class BodaBodaListPage extends StatefulWidget {
  @override
  _BodaBodaListPageState createState() => _BodaBodaListPageState();
}

class _BodaBodaListPageState extends State<BodaBodaListPage> {
  AuthenticationBloc _authenticationBloc;
  BodaBodaListBloc _bodaBodaListBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _authenticationBloc = AuthenticationBlocProvider.of(context).authenticationBloc;
    _bodaBodaListBloc = BodaBodaListBlocProvider.of(context).bodaBodaListBloc;
  }

  @override
  void dispose() {
    // _authenticationBloc.dispose();
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
          if (snapshop.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshop.hasData) {
            return buildListWithCards(snapshop);
          } else
            return Center(
              child: Container(
                child: Text('Please Add Boda Boda Riders'),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => EditBodaBodaBlocProvider(
              bodaBodaBloc: EditBodaBodaBloc(
                authenticationApi: AuthenticationService(),
                bodaBoda: BodaBoda(),
                bodaBodaAPI: BodaBodaService(),
                register: true,
              ),
              child: EditBodaBodaPage(),
            )
          ));
        },
      ),
    );
  }

  Widget _buildBodaBodaCard(AsyncSnapshot snapshop) {
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
        onTap: () {},
      ),
    );
  }

  Widget buildListWithCards(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) => Card(
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
                          snapshot.data[index].firstName,
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => Container(),
    );
  }
}
