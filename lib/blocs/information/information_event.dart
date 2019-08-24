import 'package:congresso_unama/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InformationEvent extends Equatable {
  InformationEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadInformation extends InformationEvent {}

class UpdateInformation extends InformationEvent {
  final Location location;

  UpdateInformation(this.location) : super([location]);
}
