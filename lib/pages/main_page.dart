import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kazendemotors/blocs/association/bodaboda_association_bloc.dart';
import 'package:kazendemotors/blocs/association/bodaboda_association_bloc_provider.dart';
import 'package:kazendemotors/pages/bodaboda_assocation_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Row(
          children: <Widget>[
            Icon(
              Icons.save
            ),
            Icon(
              Icons.location_on
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildSingleClientTiles(),
            _buildSingleClientTiles(),
            _buildSingleClientTiles(),
            _buildSingleClientTiles()
          ],
        ),
      ),
    );
  }

  Widget _buildSingleClientTiles() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image_simon.jpg'),
                  radius: 35.0,
                ),
                SizedBox(width: 40.0,),
                _buildSideColumn(),
              ],
            ),
            Divider(),
            _buildRowOfIconButtons(),
            Divider()
          ],
        ),
      ),
    );
  }

  Widget _buildSideColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Simon Peter Ojok',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Text('Koro Abili'),
        Text(
          '10-October-2020',
          style: TextStyle(
            color: Colors.grey
          ),
        )
      ],
    );
  }

  Widget _buildRowOfIconButtons() {
    return Row(
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
                builder: (BuildContext context) => BodaBodaAssociationBlocProvider(
                  child: BodabodaAssociationPage(),
                  bodaBodaAssociationBloc: BodaBodaAssociationBloc(
                    // TODO: Params are to be update
                  ),
                )
              ),
            )
          },
        ),
      ],
    );
  }
}
