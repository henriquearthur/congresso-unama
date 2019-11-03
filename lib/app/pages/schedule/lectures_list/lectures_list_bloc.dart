import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_module.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:congresso_unama/app/shared/repositories/lecture_repository.dart';
import 'package:rxdart/rxdart.dart';

class LecturesListBloc extends BlocBase {
  LectureRepository _lectureRepository =
      ScheduleModule.to.getDependency<LectureRepository>();

  BehaviorSubject<List<Lecture>> _lecturesListController =
      BehaviorSubject<List<Lecture>>();
  Observable<List<Lecture>> get lecturesListOut =>
      _lecturesListController.stream;
  Sink<List<Lecture>> get _lecturesListIn => _lecturesListController.sink;

  StreamSubscription _lecturesSubscription;

  void fetchLectures(Congress congress) {
    _lecturesSubscription =
        _lectureRepository.getLectures(congress).listen(_lecturesListIn.add);
  }

  @override
  void dispose() {
    _lecturesListController.close();

    _lecturesSubscription?.cancel();
    super.dispose();
  }
}
