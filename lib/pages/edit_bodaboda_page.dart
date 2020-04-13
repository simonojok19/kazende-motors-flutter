import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/bodaboda_bloc_provider.dart';
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
    return Scaffold();
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
