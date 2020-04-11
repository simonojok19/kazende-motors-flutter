import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/bodaboda_list/bodaboda_list_bloc.dart';

class BodaBodaListBlocProvider extends InheritedWidget {
  final BodaBodaListBloc bodaBodaListBloc;
  final String uid;

  const BodaBodaListBlocProvider({ Key key, Widget child, this.bodaBodaListBloc, this.uid }): super(key: key, child: child);
  
  static BodaBodaListBlocProvider of(BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<BodaBodaListBlocProvider>();
  }
  
  @override
  bool updateShouldNotify(BodaBodaListBlocProvider old) {
    return bodaBodaListBloc != old.bodaBodaListBloc;
  }
  
}