import 'package:congresso_unama/models/congress.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressEvent extends Equatable {
  CongressEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadCongress extends CongressEvent {
  final String name;

  LoadCongress(this.name) : super([name]);
}

class LoadedCongress extends CongressEvent {
  final Congress congress;

  LoadedCongress(this.congress) : super([congress]);
}

class LoadCongressList extends CongressEvent {}

class LoadedCongressList extends CongressEvent {
  final List<Congress> congresses;

  LoadedCongressList(this.congresses) : super([congresses]);
}
