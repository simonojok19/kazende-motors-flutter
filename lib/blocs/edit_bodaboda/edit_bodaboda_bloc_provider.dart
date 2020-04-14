import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/edit_bodaboda_bloc.dart';

class EditBodaBodaBlocProvider extends InheritedWidget {
  final EditBodaBodaBloc bodaBodaBloc;

  const EditBodaBodaBlocProvider({ Key key, Widget child, this.bodaBodaBloc }) : super(key: key, child: child);

  static EditBodaBodaBlocProvider of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EditBodaBodaBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}