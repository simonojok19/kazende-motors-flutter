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
    return Container();
  }
}
