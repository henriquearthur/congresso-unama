import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressScheduleFilterEvent extends Equatable {
  CongressScheduleFilterEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadCongresses extends CongressScheduleFilterEvent {}

class AddCongress extends CongressScheduleFilterEvent {
  final String congressId;

  AddCongress(this.congressId) : super([congressId]);
}

class DeleteCongress extends CongressScheduleFilterEvent {
  final String congressId;

  DeleteCongress(this.congressId) : super([congressId]);
}
