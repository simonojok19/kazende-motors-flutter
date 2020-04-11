import 'package:flutter/material.dart';
import 'package:kazendemotors/blocs/location/location_bloc.dart';
import 'package:kazendemotors/classes/authentication_api.dart';

class LocationBlocProvider extends InheritedWidget {
  final LocationBloc locationBloc;
  final AuthenticationApi authenticationApi;

  const LocationBlocProvider({Key key, Widget child, this.locationBloc, this.authenticationApi}): super(key: key, child: child);

  static LocationBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocationBlocProvider>();
  }
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
  }
  
}