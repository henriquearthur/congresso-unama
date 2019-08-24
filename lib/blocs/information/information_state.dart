import 'package:congresso_unama/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InformationState extends Equatable {
  InformationState([List props = const <dynamic>[]]) : super(props);
}

class InitialInformationState extends InformationState {}

class LoadingInformationState extends InformationState {}

class LoadedInformationState extends InformationState {
  final Location location;

  LoadedInformationState(this.location) : super([location]);
}
