import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/repositories/congress_repository.dart';
import './bloc.dart';

class CongressBloc extends Bloc<CongressEvent, CongressState> {
  final CongressRepository congressRepository;
  StreamSubscription subscription;

  CongressBloc({@required this.congressRepository});

  @override
  CongressState get initialState => InitialCongressState();

  @override
  Stream<CongressState> mapEventToState(
    CongressEvent event,
  ) async* {
    if (event is LoadCongress) {
      yield* _mapLoadCongressToState(event);
    }

    if (event is LoadedCongress) {
      yield* _mapLoadedCongressToState(event);
    }

    if (event is LoadCongressList) {
      yield* _mapLoadCongressListToState();
    }

    if (event is LoadedCongressList) {
      yield* _mapLoadedCongressListToState(event);
    }
  }

  Stream<CongressState> _mapLoadCongressToState(LoadCongress event) async* {
    yield LoadingCongressState();

    subscription?.cancel();
    subscription = congressRepository
        .getCongress(event.name)
        .listen((congress) => dispatch(LoadedCongress(congress)));
  }

  Stream<CongressState> _mapLoadedCongressToState(LoadedCongress event) async* {
    yield LoadedCongressState(event.congress);
  }

  Stream<CongressState> _mapLoadCongressListToState() async* {
    yield LoadingCongressListState();

    subscription?.cancel();
    subscription = congressRepository
        .getCongresses()
        .listen((congresses) => dispatch(LoadedCongressList(congresses)));
  }

  Stream<CongressState> _mapLoadedCongressListToState(
      LoadedCongressList event) async* {
    yield LoadedCongressListState(event.congresses);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
