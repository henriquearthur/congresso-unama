import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:congresso_unama/repositories/information_repository.dart';
import './bloc.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final InformationRepository informationRepository;
  StreamSubscription subscription;

  InformationBloc({@required this.informationRepository});

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  InformationState get initialState => InitialInformationState();

  @override
  Stream<InformationState> mapEventToState(
    InformationEvent event,
  ) async* {
    if (event is LoadInformation) {
      yield LoadingInformationState();

      subscription?.cancel();
      subscription = informationRepository
          .getInformation()
          .listen((information) => dispatch(UpdateInformation(information)));
    }

    if (event is UpdateInformation) {
      yield LoadedInformationState(event.information);
    }
  }
}
