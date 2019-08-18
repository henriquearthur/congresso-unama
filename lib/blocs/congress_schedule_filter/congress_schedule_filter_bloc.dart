import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class CongressScheduleFilterBloc
    extends Bloc<CongressScheduleFilterEvent, CongressScheduleFilterState> {
  @override
  CongressScheduleFilterState get initialState => CongressesLoading();

  @override
  Stream<CongressScheduleFilterState> mapEventToState(
    CongressScheduleFilterEvent event,
  ) async* {
    if (event is LoadCongresses) {
      yield* _mapLoadCongressesToState(event);
    } else if (event is AddCongress) {
      // TODO: BLoC - Create AddCongress logic. Test for Singleton class like EventFilter.
    } else if (event is DeleteCongress) {}
  }

  Stream<CongressScheduleFilterState> _mapLoadCongressesToState(
      LoadCongresses event) async* {
    if (currentState is CongressesLoaded) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> congressesId =
          prefs.getStringList("congress_schedule_filter") ??
              ['arquitetura', 'computacao', 'engenharia'];

      List<Congress> congresses =
          congressesId.map((id) => Congress(id: id)).toList();

      yield CongressesLoaded(congresses);
    }
  }
}
