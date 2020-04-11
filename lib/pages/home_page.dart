import 'package:flutter/material.dart';

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
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                ],
              ),
              onTap: () { },
            ),
          ),
        ],
      ),
    );
  }
}