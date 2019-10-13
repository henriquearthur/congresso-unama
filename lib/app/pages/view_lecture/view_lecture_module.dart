import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/view_lecture/view_lecture_page.dart';

class ViewLectureModule extends ModuleWidget {
  final Lecture lecture;

  ViewLectureModule({@required this.lecture});

  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ViewLecturePage(lecture: lecture);

  static Inject get to => Inject<ViewLectureModule>.of();
}
