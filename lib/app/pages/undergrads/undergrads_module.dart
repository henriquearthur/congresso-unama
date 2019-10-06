import 'package:congresso_unama/app/pages/undergrads/undergrads_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/undergrads/undergrads_page.dart';

class UndergradsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => UndergradsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => UndergradsPage();

  static Inject get to => Inject<UndergradsModule>.of();
}
