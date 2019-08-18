import 'package:congresso_unama/models/lecture.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ScheduleEvent extends Equatable {
  ScheduleEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadSchedule extends ScheduleEvent {}

class UpdateSchedule extends ScheduleEvent {
  final List<Lecture> lectures;

  UpdateSchedule(this.lectures) : super([lectures]);
}
