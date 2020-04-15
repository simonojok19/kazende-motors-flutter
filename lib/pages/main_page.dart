import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kazendemotors/blocs/association/bodaboda_association_bloc.dart';
import 'package:kazendemotors/blocs/association/bodaboda_association_bloc_provider.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc_provider.dart';
import 'package:kazendemotors/blocs/main_page/main_page_bloc.dart';
import 'package:kazendemotors/blocs/main_page/main_page_bloc_provider.dart';
import 'package:kazendemotors/blocs/type_edit/loan_type_edit_bloc_provider.dart';
import 'package:kazendemotors/classes/authentication.dart';
import 'package:kazendemotors/classes/authentication_api.dart';
import 'package:kazendemotors/models/bodboda_model.dart';
import 'package:kazendemotors/pages/bodaboda_assocation_page.dart';
import 'package:kazendemotors/pages/edit_bodaboda_page.dart';
import 'package:kazendemotors/services/bodaboda/bodaboda_service.dart';
import 'package:kazendemotors/widget/bodaboda_card_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageBloc _mainPageBloc;


  @override
  void dispose() {
    _mainPageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: RaisedButton(
          child: Row(
            children: <Widget>[Icon(Icons.search), Text('Search')],
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.indigo,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.sort,
                  color: Colors.white,
                  size: 25.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                _buildMotorListIconButton(),
                SizedBox(
                  width: 20.0,
                ),
                _buildPaymentLisIconButton(),
                SizedBox(
                  width: 20.0,
                ),
                _buildPrintIconButton(),
                SizedBox(
                  width: 20.0,
                ),
                _buildListLoanApplicationIconButton(),
                SizedBox(
                  width: 20.0,
                ),
                _buildEditIconButton()
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _mainPageBloc.bodaBoda,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return BodaBodaCardWidget(snapshot: snapshot,);
            } else {
              return Center(
                child: Text('Add Some BodaBoda'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSingleClientTiles(AsyncSnapshot snapshot) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image_simon.jpg'),
                  radius: 35.0,
                ),
                // SizedBox(
                //   width: 140.0,
                // ),
                _buildSideColumn(snapshot),
              ],
            ),
            Text(
              '200,000',
              style: TextStyle(
                fontSize: 25.0
              ),
            ),
            Divider(),
            _buildRowOfIconButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
    var data = snapshot.data;
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) => Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(),
        ),
      ),
    );
  }

  Widget _buildSideColumn(AsyncSnapshot snapshot) {
    String firstName = snapshot.data['firstName'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          firstName,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Text('Koro Abili'),
        Text(
          '10-October-2020',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget _buildRowOfIconButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_balance_wallet,
                size: 25.0,
              ),
              Text(
                'Loans',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.motorcycle,
                size: 25.0,
              ),
              Text(
                'Motor',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.departure_board,
                size: 25.0,
              ),
              Text(
                'Stage',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 25.0,
              ),
              Text(
                'Address',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                size: 25.0,
              ),
              Text(
                'Payment',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.people,
                size: 25.0,
              ),
              Text(
                'Association',
                style: TextStyle(fontSize: 10.0, color: Colors.grey),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) =>
                      BodaBodaAssociationBlocProvider(
                        child: BodabodaAssociationPage(),
                        bodaBodaAssociationBloc: BodaBodaAssociationBloc(
                            // TODO: Params are to be update
                            ),
                      )),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEditIconButton() {
    return InkWell(
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => EditBodaBodaBlocProvider(
                      child: EditBodaBodaPage(),
                      bodaBodaBloc: EditBodaBodaBloc(
                          authenticationApi: AuthenticationService(),
                          bodaBoda: BodaBoda(),
                          bodaBodaAPI: BodaBodaService(),
                          register: true),
                    )));
      },
    );
  }

  Widget _buildListLoanApplicationIconButton() {
    return InkWell(
      child: Icon(
        Icons.account_balance,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => EditBodaBodaBlocProvider(
                      child: EditBodaBodaPage(),
                      bodaBodaBloc: EditBodaBodaBloc(
                          authenticationApi: AuthenticationService(),
                          bodaBoda: BodaBoda(),
                          bodaBodaAPI: BodaBodaService(),
                          register: true),
                    )));
      },
    );
  }

  Widget _buildPrintIconButton() {
    return InkWell(
      child: Icon(
        Icons.print,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => EditBodaBodaBlocProvider(
                      child: EditBodaBodaPage(),
                      bodaBodaBloc: EditBodaBodaBloc(
                          authenticationApi: AuthenticationService(),
                          bodaBoda: BodaBoda(),
                          bodaBodaAPI: BodaBodaService(),
                          register: true),
                    )));
      },
    );
  }


  Widget _buildPaymentLisIconButton() {
    return InkWell(
      child: Icon(
        Icons.card_membership,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => EditBodaBodaBlocProvider(
                      child: EditBodaBodaPage(),
                      bodaBodaBloc: EditBodaBodaBloc(
                          authenticationApi: AuthenticationService(),
                          bodaBoda: BodaBoda(),
                          bodaBodaAPI: BodaBodaService(),
                          register: true),
                    )));
      },
    );
  }

  Widget _buildMotorListIconButton() {
    return InkWell(
      child: Icon(
        Icons.assignment,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => EditBodaBodaBlocProvider(
                      child: EditBodaBodaPage(),
                      bodaBodaBloc: EditBodaBodaBloc(
                          authenticationApi: AuthenticationService(),
                          bodaBoda: BodaBoda(),
                          bodaBodaAPI: BodaBodaService(),
                          register: true),
                    )));
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mainPageBloc = MainPageBlocProvider.of(context).mainPageBloc;
  }
}
