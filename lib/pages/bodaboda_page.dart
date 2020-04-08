import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc_provider.dart';

class BodaBodaPage extends StatefulWidget {
  @override
  _BodaBodaPageState createState() => _BodaBodaPageState();
}

class _BodaBodaPageState extends State<BodaBodaPage> {
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
    print('==========================================');
    print(BodaBodaBlocProvider.of(context));
    _bodaBodaBloc = BodaBodaBlocProvider.of(context).bodaBodaBloc;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _bodaBodaBloc.dispose();
    super.dispose();
  }

  void _addOrEditBodaBoda() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BodaBoda Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                sink: _bodaBodaBloc.middleNameChanged
              ),
              // lastName
              _createTextField(
                stream: _bodaBodaBloc.lastName,
                labelText: 'Last Name',
                icon: Icon(Icons.person),
                sink: _bodaBodaBloc.lastNameChanged
              ),

              _createTextField(
                stream: _bodaBodaBloc.dateOfBirth,
                labelText: 'Date of Birth',
                icon: Icon(Icons.calendar_today),
                sink: _bodaBodaBloc.dateOfBirthChanged
              ),

              _createTextField(
                stream: _bodaBodaBloc.permitNumber,
                labelText: 'Permit Number',
                icon: Icon(Icons.motorcycle),
                sink: _bodaBodaBloc.permitNumberChanged
              ),

              _createTextField(
                stream: _bodaBodaBloc.stageID,
                labelText: 'Stage',
                icon: Icon(Icons.local_parking),
                sink: _bodaBodaBloc.stageIDChanged,
              ),

              _createTextField(
                stream: _bodaBodaBloc.locationID,
                labelText: 'Location',
                icon: Icon(Icons.my_location),
                sink: _bodaBodaBloc.locationIDChanged
              ),

              _createTextField(
                stream: _bodaBodaBloc.motorcycleID,
                labelText: 'Motorcycle',
                icon: Icon(Icons.motorcycle),
                sink: _bodaBodaBloc.motorcycleIDChanged
              ),
              SizedBox(height: 20.0,),
              OutlineButton(
                onPressed: () { _bodaBodaBloc.saveBodaBoda(); },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.save),
                    SizedBox(width: 10.0,),
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
