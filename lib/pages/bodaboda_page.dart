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

              // lastName
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTextField() {
    return StreamBuilder(
      stream: _bodaBodaBloc.firstName,
      builder: (BuildContext context, AsyncSnapshot snapshot) => TextField(
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'First Name',
            icon: Icon(Icons.person),
            errorText: snapshot.error),
        onChanged: _bodaBodaBloc.firstNameChanged.add,
      ),
    );
  }
}
