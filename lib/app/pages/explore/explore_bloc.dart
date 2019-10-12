import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/pages/explore/explore_module.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/speaker.dart';
import 'package:congresso_unama/app/shared/repositories/speaker_repository.dart';
import 'package:rxdart/rxdart.dart';

class ExploreBloc extends BlocBase {
  SpeakerRepository _speakerRepository =
      ExploreModule.to.getDependency<SpeakerRepository>();

  BehaviorSubject<List<Speaker>> _speakersListController =
      BehaviorSubject<List<Speaker>>();
  Observable<List<Speaker>> get speakersListOut =>
      _speakersListController.stream;
  Sink<List<Speaker>> get speakersListIn => _speakersListController.sink;

  StreamSubscription _congressSubscription;

  void getSpeakersList(Congress congress) {
    _congressSubscription?.cancel();
    _congressSubscription =
        _speakerRepository.getSpeakers(congress).listen(speakersListIn.add);
  }

  @override
  void dispose() {
    _speakersListController.close();
    _congressSubscription?.cancel();
    super.dispose();
  }
}
