import 'dart:async';
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
          .listen((speakers) => dispatch(LoadedSpeakers(speakers)));
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
}
