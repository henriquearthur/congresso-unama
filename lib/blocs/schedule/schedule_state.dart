import 'package:congresso_unama/models/lecture.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ScheduleState extends Equatable {
  ScheduleState([List props = const <dynamic>[]]) : super(props);
}

class InitialScheduleState extends ScheduleState {}

class LoadingScheduleState extends ScheduleState {}

class LoadedScheduleState extends ScheduleState {
  final List<Lecture> lectures;

  LoadedScheduleState(this.lectures) : super([lectures]);
}
