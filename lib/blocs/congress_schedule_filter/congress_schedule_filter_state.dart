import 'package:congresso_unama/blocs/congress_schedule_filter/bloc.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressScheduleFilterState extends Equatable {
  CongressScheduleFilterState([List props = const <dynamic>[]]) : super(props);
}

class CongressesLoading extends CongressScheduleFilterState {}

class CongressesLoaded extends CongressScheduleFilterState {
  final List<Congress> congresses;

  CongressesLoaded(this.congresses);
}
