import 'package:congresso_unama/app/pages/pick_congress/pick_congress_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/pick_congress/pick_congress_page.dart';

class PickCongressModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PickCongressBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PickCongressPage();

  static Inject get to => Inject<PickCongressModule>.of();
}
