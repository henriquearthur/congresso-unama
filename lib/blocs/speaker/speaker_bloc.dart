import 'dart:async';
import 'dart:collection';
import 'package:congresso_unama/models/speaker.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/repositories/speaker_repository.dart';
import './bloc.dart';

class SpeakerBloc extends Bloc<SpeakerEvent, SpeakerState> {
  final SpeakerRepository speakerRepository;
  StreamSubscription subscription;

  SpeakerBloc({@required this.speakerRepository});

  @override
  SpeakerState get initialState => InitialSpeakerState();

  @override
  Stream<SpeakerState> mapEventToState(
    SpeakerEvent event,
  ) async* {
    if (event is LoadSpeakers) {
      yield LoadingSpeakersState();

      subscription?.cancel();
      subscription = speakerRepository
          .getCongressSpeakers(event.congress)
          .listen((speakers) async {
        // A Speaker can perform multiple Lectures. But on the Speakers List the speaker must not repeat itself.
        List<Speaker> uniqueSpeakers = await _getUniqueSpeakers(speakers);
        dispatch(LoadedSpeakers(uniqueSpeakers));
      });
    }

    if (event is LoadedSpeakers) {
      yield LoadedSpeakersState(event.speakers);
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  _getUniqueSpeakers(List<Speaker> speakers) {
    return speakers.toSet().toList();
  }
}
