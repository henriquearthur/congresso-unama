import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/models/speaker.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerEvent extends Equatable {
  SpeakerEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadSpeakers extends SpeakerEvent {
  final Congress congress;

  LoadSpeakers(this.congress) : super([congress]);
}

class LoadedSpeakers extends SpeakerEvent {
  final List<Speaker> speakers;

  LoadedSpeakers(this.speakers) : super([speakers]);
}
