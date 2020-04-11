import 'package:flutter/material.dart';
import 'package:kazendemotors/models/location/location_model.dart';

class LocationDialog {
  static Future<Location> registerLocation(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register Location'),
          content: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16.0
                ),
                decoration: InputDecoration(
                  labelText: 'District',
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16.0
                ),
                decoration: InputDecoration(
                  labelText: 'SubCounty',
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16.0
                ),
                decoration: InputDecoration(
                  labelText: 'Village',
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder()
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context, Location(district: 'Gulu'));
              },
            ),
            FlatButton(
              child: Text('Register', style: TextStyle(color: Colors.green),),
              onPressed: () {
                Navigator.pop(context, Location(district: 'Gulu'));
              },
            ),
          ],
        );
      }
    );
  }
}