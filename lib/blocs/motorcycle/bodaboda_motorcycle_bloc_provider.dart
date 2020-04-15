import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/motorcycle/bodaboda_motorcycle_page_bloc.dart';

class BodaBodaMotorCyclePageBlocProvider extends InheritedWidget {
  final BodaBodaMotorCyclePageBloc bodabodaMotorCyclePageBloc;
  const BodaBodaMotorCyclePageBlocProvider({Key key, Widget child, this.bodabodaMotorCyclePageBloc}): super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static BodaBodaMotorCyclePageBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BodaBodaMotorCyclePageBlocProvider>();
  }

}