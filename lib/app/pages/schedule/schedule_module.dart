import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/shared/repositories/lecture_repository.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_page.dart';

class ScheduleModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LectureRepository()),
      ];

  @override
  Widget get view => SchedulePage();

  static Inject get to => Inject<ScheduleModule>.of();
}
