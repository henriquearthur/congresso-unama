import 'package:congresso_unama/models/speaker.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerState extends Equatable {
  SpeakerState([List props = const <dynamic>[]]) : super(props);
}

class InitialSpeakerState extends SpeakerState {}

class LoadingSpeakersState extends SpeakerState {}

class LoadedSpeakersState extends SpeakerState {
  final List<Speaker> speakers;

  LoadedSpeakersState(this.speakers) : super([speakers]);
}
