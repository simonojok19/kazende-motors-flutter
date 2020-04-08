import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bodaboda Contacts',
          style: TextStyle(color: Colors.orange.shade800),
        ),
        elevation: 0.0,
        bottom: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(32.0),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange, Colors.orange.shade50],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.orange.shade800,
            ),
            onPressed: () {
              print('data should be printed here');
              Firestore.instance
                  .collection("bodbodacontacts").getDocuments().then(
                    (value) {
                      print(value);
                    }
                  ).catchError((error) => print('error'));
              print('data should be printed here done');
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 44.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange.shade50, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Add BodaBoda Contacts',
      //   backgroundColor: Colors.orange.shade300,
      //   child: Icon(Icons.person_add),
      //   onPressed: () async {
      //     // TODO: Add a new contact
      //   },
      // ),
    );
  }
}
