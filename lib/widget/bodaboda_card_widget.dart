import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodaBodaCardWidget extends StatefulWidget {
  final AsyncSnapshot snapshot;
  const BodaBodaCardWidget({Key key, this.snapshot}): super(key: key);
  @override
  _BodaBodaCardWidgetState createState() => _BodaBodaCardWidgetState();
}

class _BodaBodaCardWidgetState extends State<BodaBodaCardWidget> {
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot snapshot = widget.snapshot;
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) => Card(
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
                ],
              ),
              Text(
                '200, 000',
                style: TextStyle(
                  fontSize: 25.0
                ),
              ),
              Divider(),
              // buttons row of buttons
            ],
          ),
        ),
      ),
    );
  }
}
