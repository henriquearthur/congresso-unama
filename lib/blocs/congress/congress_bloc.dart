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
      yield LoadingCongressState();

      subscription?.cancel();
      subscription = congressRepository
          .getCongress(event.name)
          .listen((congress) => dispatch(LoadedCongress(congress)));
    }

    if (event is LoadedCongress) {
      yield LoadedCongressState(event.congress);
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
