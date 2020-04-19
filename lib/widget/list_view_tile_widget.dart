import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListViewTileWidget extends StatefulWidget {
  AsyncSnapshot snapshot;
  ListViewTileWidget({ Key key, this.snapshot }): super(key: key);

  @override
  _ListViewTileWidgetState createState() => _ListViewTileWidgetState();
}

class _ListViewTileWidgetState extends State<ListViewTileWidget> {
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot _snapshot = widget.snapshot;
    return ListView.separated(
      itemCount: _snapshot.data.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Column(
          children: <Widget>[
            Text(
              '20th',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.blue
              ),
            ),
            Text(
              '2019'
            )
          ],
        ),
        title: Text(
          '20, 000',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Spear Parts'
        ),
        trailing: Icon(Icons.close),
      ),
      separatorBuilder: (BuildContext context, int index) => Container(),
    );
  }
}
