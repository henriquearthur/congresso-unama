import 'package:congresso_unama/app/pages/schedule/schedule_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_page.dart';

class ScheduleModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ScheduleBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SchedulePage();

  static Inject get to => Inject<ScheduleModule>.of();
}
