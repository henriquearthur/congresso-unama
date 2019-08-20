import 'package:congresso_unama/models/paper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaperState extends Equatable {
  PaperState([List props = const <dynamic>[]]) : super(props);
}

class InitialPaperState extends PaperState {}

class LoadingPapersState extends PaperState {}

class LoadedPapersState extends PaperState {
  final List<Paper> papers;

  LoadedPapersState(this.papers) : super([papers]);
}
