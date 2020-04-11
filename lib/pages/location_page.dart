import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/location/location_bloc.dart';
import 'package:kazendemotors/blocs/location/location_bloc_provider.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationBloc _locationBloc;

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locationBloc = LocationBlocProvider.of(context).locationBloc;

  }

  @override
  void dispose() {
    _locationBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Registration'),
        actions: <Widget>[

        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _createTextField(
                stream: _locationBloc.district,
                labelText: 'District',
                icon: null,
                sink: _locationBloc.districtChanged
              ),
              _createTextField(
                stream: _locationBloc.subCounty,
                labelText: 'Sub County',
                icon: null,
                sink: _locationBloc.subCountyChanged
              ),

              _createTextField(
                stream: _locationBloc.village,
                labelText: 'Village',
                icon: null,
                sink: _locationBloc.villageChanged
              ),

              SizedBox(
                height: 20.0,
              ),
              OutlineButton(
                onPressed: () {
                  _locationBloc.saveLocation();
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