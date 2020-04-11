import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc_provider.dart';
import 'package:kazendemotors/dialog/location_dailogs.dart';
import 'package:kazendemotors/models/location/location_model.dart';

class EditBodaBodaPage extends StatefulWidget {
  @override
  _EditBodaBodaPageState createState() => _EditBodaBodaPageState();
}

class _EditBodaBodaPageState extends State<EditBodaBodaPage> {
  BodaBodaBloc _bodaBodaBloc;
  TextEditingController _firstNameController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _firstNameController.text = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bodaBodaBloc = BodaBodaBlocProvider.of(context).bodaBodaBloc;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _bodaBodaBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BodaBoda Registration'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              Location location =
                  await LocationDialog.registerLocation(context);
              print(location.toString());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100.0,
              ),
              Text(
                'Registration Form',
                style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
              ),
              // first Name
              _createTextField(
                  stream: _bodaBodaBloc.firstName,
                  labelText: 'First Name',
                  icon: Icon(Icons.person),
                  sink: _bodaBodaBloc.firstNameChanged),
              // middleName
              _createTextField(
                  stream: _bodaBodaBloc.middleName,
                  labelText: 'Middle Name',
                  icon: Icon(Icons.person),
                  sink: _bodaBodaBloc.middleNameChanged),
              // lastName
              _createTextField(
                  stream: _bodaBodaBloc.lastName,
                  labelText: 'Last Name',
                  icon: Icon(Icons.person),
                  sink: _bodaBodaBloc.lastNameChanged),

              _createTextField(
                  stream: _bodaBodaBloc.dateOfBirth,
                  labelText: 'Date of Birth',
                  icon: Icon(Icons.calendar_today),
                  sink: _bodaBodaBloc.dateOfBirthChanged),

              _createTextField(
                  stream: _bodaBodaBloc.permitNumber,
                  labelText: 'Permit Number',
                  icon: Icon(Icons.motorcycle),
                  sink: _bodaBodaBloc.permitNumberChanged),

              Row(
                children: <Widget>[
                  _createTextField(
                    stream: _bodaBodaBloc.stageID,
                    labelText: 'Stage',
                    icon: Icon(Icons.local_parking),
                    sink: _bodaBodaBloc.stageIDChanged,
                  ),
                  IconButton(
                    icon: Icon(Icons.place),
                    onPressed: () { },
                  ),
                ],
              ),

              _createTextField(
                  stream: _bodaBodaBloc.locationID,
                  labelText: 'Location',
                  icon: Icon(Icons.my_location),
                  sink: _bodaBodaBloc.locationIDChanged),

              _createTextField(
                  stream: _bodaBodaBloc.motorcycleID,
                  labelText: 'Motorcycle',
                  icon: Icon(Icons.motorcycle),
                  sink: _bodaBodaBloc.motorcycleIDChanged),
              SizedBox(
                height: 20.0,
              ),
              OutlineButton(
                onPressed: () {
                  _bodaBodaBloc.saveBodaBoda();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.save),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Save',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
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
