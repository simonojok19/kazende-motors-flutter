import 'package:flutter/material.dart';

class BodaBodaMotorCyclePage extends StatefulWidget {
  String bodabodaID;
  BodaBodaMotorCyclePage({ Key key, this.bodabodaID }): super(key: key);

  @override
  _BodaBodaMotorCyclePageState createState() => _BodaBodaMotorCyclePageState();
}

class _BodaBodaMotorCyclePageState extends State<BodaBodaMotorCyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bodabodaID),),
    );
  }
}
