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

  BehaviorSubject<bool> _mustSelectCongressController = BehaviorSubject<bool>();
  Observable<bool> get mustSelectCongressOut =>
      _mustSelectCongressController.stream;
  Sink<bool> get mustSelectCongressIn => _mustSelectCongressController.sink;

  CongressBloc() {
    configureCurrent();
  }

  void configureCurrent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();

    if (prefs.containsKey(currentCongressKey)) {
      _congressRepository.getCongresses().listen((congresses) async {
        String congressId = prefs.getString(currentCongressKey);

        congresses
            .where((congress) => congress.id == congressId)
            .forEach(congressIn.add);

        mustSelectCongressIn.add(false);
      });
    } else {
      mustSelectCongressIn.add(true);
    }
  }

  Future pick(Congress congress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(currentCongressKey, congress.id);
    congressIn.add(congress);
    mustSelectCongressIn.add(false);
  }

  @override
  void dispose() {
    _congressController.close();
    _mustSelectCongressController.close();
    super.dispose();
  }
}
