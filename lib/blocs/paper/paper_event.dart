import 'package:congresso_unama/models/paper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaperEvent extends Equatable {
  PaperEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadPapers extends PaperEvent {}

class UpdatePapers extends PaperEvent {
  final List<Paper> papers;

  UpdatePapers(this.papers) : super([papers]);
}
