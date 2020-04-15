import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/motorcycle/motorcycle_bloc.dart';

class MotorCycleBlocProvider extends InheritedWidget {
  final MotorCycleBloc motorCycleBloc;
  const MotorCycleBlocProvider({Key key, Widget child, this.motorCycleBloc}): super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static MotorCycleBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MotorCycleBlocProvider>();
  }

}