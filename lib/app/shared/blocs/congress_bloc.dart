import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/repositories/congress_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CongressBloc extends BlocBase {
  CongressRepository _congressRepository =
      AppModule.to.getDependency<CongressRepository>();

  final String currentCongressKey = 'default_congress_id';

  BehaviorSubject<Congress> _congressController = BehaviorSubject<Congress>();
  Observable<Congress> get congressOut => _congressController.stream;
  Sink<Congress> get congressIn => _congressController.sink;

  CongressBloc() {
    configureCurrent();
  }

  void configureCurrent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(currentCongressKey)) {
      _congressRepository.getCongresses().listen((congresses) async {
        Congress congress;

        String congressId = prefs.getString(currentCongressKey);
        congress =
            congresses.where((congress) => congress.id == congressId).single;

        congressIn.add(congress);
      });
    }
  }

  @override
  void dispose() {
    _congressController.close();
    super.dispose();
  }
}
