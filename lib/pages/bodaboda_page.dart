import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc.dart';
import 'package:kazendemotors/blocs/bodaboda_bloc_provider.dart';

class BodaBodaRegistrationPage extends StatefulWidget {
  @override
  _BodaBodaRegistrationPageState createState() => _BodaBodaRegistrationPageState();
}

class _BodaBodaRegistrationPageState extends State<BodaBodaRegistrationPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
            ],
          ),
        ),
      ),
    );
  }
}