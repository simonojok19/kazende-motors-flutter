import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/association/bodaboda_association_bloc.dart';

class BodaBodaAssociationBlocProvider extends InheritedWidget {
  final BodaBodaAssociationBloc bodaBodaAssociationBloc;

  const BodaBodaAssociationBlocProvider({Key key, Widget child, this.bodaBodaAssociationBloc}): super(key: key, child: child);

  static BodaBodaAssociationBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BodaBodaAssociationBlocProvider>();
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}