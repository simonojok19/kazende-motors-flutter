import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/main_page/main_page_bloc.dart';

class MainPageBlocProvider extends InheritedWidget {
  final MainPageBloc mainPageBloc;

  const MainPageBlocProvider({ Key key, Widget child, this.mainPageBloc}): super(key: key, child: child);

  static MainPageBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainPageBlocProvider>();
  }



  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}