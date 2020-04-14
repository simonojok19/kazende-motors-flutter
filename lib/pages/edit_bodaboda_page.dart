import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc_provider.dart';
import 'package:kazendemotors/dialog/location_dailogs.dart';
import 'package:kazendemotors/models/location/location_model.dart';

class EditBodaBodaPage extends StatefulWidget {
  @override
  _EditBodaBodaPageState createState() => _EditBodaBodaPageState();
}

class _EditBodaBodaPageState extends State<EditBodaBodaPage> {
  EditBodaBodaBloc _bodaBodaBloc;
  TextEditingController _firstNameController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bodaBodaBloc = EditBodaBodaBlocProvider.of(context).bodaBodaBloc;
  }

  @override
  void dispose() {
    _bodaBodaBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register BodaBoda'),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/image_simon.jpg'),
                        radius: 50.0,
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () { },
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            SizedBox(height: 16.0,),
            StreamBuilder(
              stream: _bodaBodaBloc.firstName,
              builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                  errorText: snapshot.error,
                ),
                onChanged: _bodaBodaBloc.firstNameChanged.add,
              ),
            ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.middleName,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Middle Name',
                    errorBorder: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.middleNameChanged.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.lastName,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    errorText: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.lastNameChanged.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.phoneNumber,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      errorText: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.phoneNumberChanged.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.nationalID,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'National ID',
                      errorText: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.nationalIDChanged.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.dateOfBirth,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth',
                      errorText: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.dateOfBirthChanged.add,
                ),
              ),
              SizedBox(height: 16.0,),
              StreamBuilder(
                stream: _bodaBodaBloc.permitNumber,
                builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Permit Number',
                      errorText: snapshot.error
                  ),
                  onChanged: _bodaBodaBloc.permitNumberChanged.add,
                ),
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: _bodaBodaBloc.saveBodaBoda,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTextField(
      {Stream stream, String labelText, Icon icon, Sink<String> sink}) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: labelText, icon: icon, errorText: snapshot.error),
        onChanged: sink.add,
      ),
    );
  }
}
