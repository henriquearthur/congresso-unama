import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CongressFilterState extends Equatable {
  CongressFilterState([List props = const <dynamic>[]]) : super(props);
}

class CongressesLoading extends CongressFilterState {}

class CongressesLoaded extends CongressFilterState {
  final List<String> congresses;

  CongressesLoaded(this.congresses) : super([congresses]);
}
