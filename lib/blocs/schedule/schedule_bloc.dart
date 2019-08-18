import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/blocs/congress_schedule_filter/bloc.dart';
import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/repositories/lecture_repository.dart';
import './bloc.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final String date;

  final LectureRepository lectureRepository;
  StreamSubscription subscription;

  final CongressScheduleFilterBloc filterBloc;
  StreamSubscription filterBlocSubscription;

  ScheduleBloc({this.lectureRepository, this.filterBloc, this.date}) {
    filterBlocSubscription = filterBloc.state.listen((state) {
      if (state is CongressesUpdated) {
        dispatch(LoadSchedule());
      }
    });
  }

  @override
  ScheduleState get initialState => InitialScheduleState();

  @override
  Stream<ScheduleState> mapEventToState(
    ScheduleEvent event,
  ) async* {
    if (event is LoadSchedule) {
      yield LoadingScheduleState();

      subscription?.cancel();
      subscription =
          lectureRepository.getLectures(date).listen((lectures) async {
        List<Lecture> filteredLectures = await _filterLectures(lectures);
        dispatch(UpdateSchedule(filteredLectures));
      });
    }

    if (event is UpdateSchedule) {
      yield LoadedScheduleState(event.lectures);
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    filterBlocSubscription.cancel();
    super.dispose();
  }

  Future<List<Lecture>> _filterLectures(List<Lecture> lectures) async {
    List<String> congresses = await filterBloc.getSavedCongresses();

    return lectures
        .where((lecture) => congresses.contains(lecture.event))
        .toList();
  }
}
