import 'package:congresso_unama/app/pages/location/location_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/location/location_page.dart';

class LocationModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LocationBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LocationPage();

  static Inject get to => Inject<LocationModule>.of();
}
