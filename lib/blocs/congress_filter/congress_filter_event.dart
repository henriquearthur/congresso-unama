import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressFilterEvent extends Equatable {
  CongressFilterEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadCongresses extends CongressFilterEvent {}

class AddCongress extends CongressFilterEvent {
  final String congressId;

  AddCongress(this.congressId) : super([congressId]);
}

class DeleteCongress extends CongressFilterEvent {
  final String congressId;

  DeleteCongress(this.congressId) : super([congressId]);
}
