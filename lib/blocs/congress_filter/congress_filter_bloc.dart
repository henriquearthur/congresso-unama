import 'dart:async';
import 'package:congresso_unama/repositories/congress_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class CongressFilterBloc
    extends Bloc<CongressFilterEvent, CongressFilterState> {
  @override
  CongressFilterState get initialState => CongressesLoading();

  @override
  Stream<CongressFilterState> mapEventToState(
    CongressFilterEvent event,
  ) async* {
    if (event is LoadCongresses) {
      yield* _mapLoadCongressesToState(event);
    } else if (event is AddCongress) {
      yield* _mapAddCongressToState(event);
    } else if (event is DeleteCongress) {
      yield* _mapDeleteCongressToState(event);
    }
  }

  Stream<CongressFilterState> _mapLoadCongressesToState(
      LoadCongresses event) async* {
    List<String> congressesId = await getSavedCongresses();

    yield CongressesLoaded(congressesId);
  }

  Stream<CongressFilterState> _mapAddCongressToState(AddCongress event) async* {
    if (currentState is CongressesLoaded) {
      List<String> congressesId = await getSavedCongresses();

      if (!congressesId.contains(event.congressId)) {
        congressesId.add(event.congressId);
      }

      yield CongressesLoaded(congressesId);
      _saveCongresses(congressesId);
    }
  }

  Stream<CongressFilterState> _mapDeleteCongressToState(
      DeleteCongress event) async* {
    if (currentState is CongressesLoaded) {
      List<String> congressesId = await getSavedCongresses();
      congressesId.remove(event.congressId);

      yield CongressesLoaded(congressesId);
      _saveCongresses(congressesId);
    }
  }

  Future<List<String>> getSavedCongresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> congressesId;

    if (prefs.containsKey("congresses_id_filter")) {
      congressesId = prefs.getStringList("congresses_id_filter");
    } else {
      CongressRepository congressRepository = CongressRepository();
      congressesId = await congressRepository.getCongressesId();

      _saveCongresses(congressesId);
    }

    return congressesId;
  }

  Future _saveCongresses(List<String> congressesId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("congresses_id_filter", congressesId);
  }
}
