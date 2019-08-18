import 'package:congresso_unama/models/congress.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressScheduleFilterEvent extends Equatable {
  CongressScheduleFilterEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadCongresses extends CongressScheduleFilterEvent {
  final List<Congress> congress;

  LoadCongresses(this.congress) : super([congress]);
}

class AddCongress extends CongressScheduleFilterEvent {
  final Congress congress;

  AddCongress(this.congress) : super([congress]);
}

class DeleteCongress extends CongressScheduleFilterEvent {
  final Congress congress;

  DeleteCongress(this.congress) : super([congress]);
}
