import 'package:congresso_unama/app/pages/view_lecture/view_lecture_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/view_lecture/view_lecture_page.dart';

class ViewLectureModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ViewLectureBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ViewLecturePage();

  static Inject get to => Inject<ViewLectureModule>.of();
}
