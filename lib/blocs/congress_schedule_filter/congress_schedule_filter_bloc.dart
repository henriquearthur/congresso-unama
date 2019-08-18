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
      yield* _mapAddCongressToState(event);
    } else if (event is DeleteCongress) {
      yield* _mapDeleteCongressToState(event);
    }
  }

  Stream<CongressScheduleFilterState> _mapLoadCongressesToState(
      LoadCongresses event) async* {
    List<String> congressesId = await getSavedCongresses();
    List<Congress> congresses = _mapCongressesIdToCongress(congressesId);

    yield CongressesLoaded(congresses);
  }

  Stream<CongressScheduleFilterState> _mapAddCongressToState(
      AddCongress event) async* {
    if (currentState is CongressesLoaded) {
      List<String> congressesId = await getSavedCongresses();

      if (!congressesId.contains(event.congressId)) {
        congressesId.add(event.congressId);
      }

      List<Congress> updatedCongresses =
          _mapCongressesIdToCongress(congressesId);

      yield CongressesLoaded(updatedCongresses);

      _saveCongresses(congressesId);
    }
  }

  Stream<CongressScheduleFilterState> _mapDeleteCongressToState(
      DeleteCongress event) async* {
    if (currentState is CongressesLoaded) {
      List<String> congressesId = await getSavedCongresses();
      congressesId.remove(event.congressId);

      List<Congress> updatedCongresses =
          _mapCongressesIdToCongress(congressesId);

      yield CongressesLoaded(updatedCongresses);

      _saveCongresses(congressesId);
    }
  }

  Future<List<String>> getSavedCongresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> congressesId;

    if (prefs.containsKey("congress_schedule_filter")) {
      congressesId = prefs.getStringList("congress_schedule_filter");
    } else {
      congressesId = ['arquitetura', 'computacao', 'engenharia'];
      _saveCongresses(congressesId);
    }

    return congressesId;
  }

  Future _saveCongresses(List<String> congressesId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("congress_schedule_filter", congressesId);
  }

  List<Congress> _mapCongressesIdToCongress(List<String> congressesId) {
    return congressesId.map((id) => Congress(id: id)).toList();
  }
}
