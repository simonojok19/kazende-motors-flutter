import 'package:flutter/material.dart';

class BodaBodaListPage extends StatefulWidget {
  @override
  _BodaBodaListPageState createState() => _BodaBodaListPageState();
}

class _BodaBodaListPageState extends State<BodaBodaListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boda Bodas'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
              _buildBodaBodaCard(),
            ],
          ),
        ),
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
