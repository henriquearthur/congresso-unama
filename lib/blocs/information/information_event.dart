import 'package:congresso_unama/models/information.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InformationEvent extends Equatable {
  InformationEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadInformation extends InformationEvent {}

class UpdateInformation extends InformationEvent {
  final Information information;

  UpdateInformation(this.information) : super([information]);
}
