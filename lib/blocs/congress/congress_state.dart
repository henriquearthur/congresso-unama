import 'package:congresso_unama/models/congress.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressState extends Equatable {
  CongressState([List props = const <dynamic>[]]) : super(props);
}

class InitialCongressState extends CongressState {}

class LoadingCongressState extends CongressState {}

class LoadedCongressState extends CongressState {
  final Congress congress;

  LoadedCongressState(this.congress) : super([congress]);
}
