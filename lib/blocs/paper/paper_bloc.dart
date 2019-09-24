import 'dart:async';
import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/models/paper.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/repositories/paper_repository.dart';
import './bloc.dart';

class PaperBloc extends Bloc<PaperEvent, PaperState> {
  final String date;

  final PaperRepository paperRepository;
  StreamSubscription subscription;

  final CongressFilterBloc filterBloc;
  StreamSubscription filterBlocSubscription;

  PaperBloc(
      {@required this.date,
      @required this.paperRepository,
      @required this.filterBloc}) {
    filterBlocSubscription = filterBloc.state.listen((state) {
      if (state is CongressesLoaded) {
        dispatch(LoadPapers());
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    filterBlocSubscription?.cancel();
    super.dispose();
  }

  @override
  PaperState get initialState => InitialPaperState();

  @override
  Stream<PaperState> mapEventToState(
    PaperEvent event,
  ) async* {
    if (event is LoadPapers) {
      yield LoadingPapersState();

      subscription?.cancel();
      subscription = paperRepository.getPapers(date).listen((papers) async {
        List<Paper> filteredPapers = await _filterPapers(papers);
        dispatch(UpdatePapers(filteredPapers));
      });
    }

    if (event is UpdatePapers) {
      yield LoadedPapersState(event.papers);
    }
  }

  Future<List<Paper>> _filterPapers(List<Paper> papers) async {
    List<String> congresses = await filterBloc.getSavedCongresses();

    return papers
        .where((paper) => congresses.contains(paper.congressId))
        .toList();
  }
}
