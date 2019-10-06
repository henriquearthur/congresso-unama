import 'package:congresso_unama/app/pages/view_congress/view_congress_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/view_congress/view_congress_page.dart';

class ViewCongressModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ViewCongressBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ViewCongressPage();

  static Inject get to => Inject<ViewCongressModule>.of();
}
