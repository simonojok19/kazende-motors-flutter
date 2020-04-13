import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/edit_bodaboda/bodaboda_bloc.dart';

class BodaBodaBlocProvider extends InheritedWidget {
  final BodaBodaBloc bodaBodaBloc;

  const BodaBodaBlocProvider({ Key key, Widget child, this.bodaBodaBloc }) : super(key: key, child: child);

  static BodaBodaBlocProvider of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BodaBodaBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}