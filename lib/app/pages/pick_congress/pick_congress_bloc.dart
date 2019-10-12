import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/repositories/congress_repository.dart';
import 'package:rxdart/rxdart.dart';

class PickCongressBloc extends BlocBase {
  final CongressRepository _congressRepository =
      AppModule.to.getDependency<CongressRepository>();

  BehaviorSubject<List<Congress>> _congressListController =
      BehaviorSubject<List<Congress>>();
  Observable<List<Congress>> get congressListOut =>
      _congressListController.stream;
  Sink<List<Congress>> get _congressListIn => _congressListController.sink;

  PickCongressBloc() {
    _congressRepository.getCongresses().listen(_congressListIn.add);
  }

  @override
  void dispose() {
    _congressListController.close();
    super.dispose();
  }
}
