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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        snapshot.data[index].firstName + "  " + snapshot.data[index].lastName
                      ),
                      Text('Koro Abili'),
                      Text(
                        '10-October-2020',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
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
              Row(
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
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => Container(),
    );
  }
}
