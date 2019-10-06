import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/shared/blocs/congress_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends BlocBase {
  final CongressBloc _congressBloc = AppModule.to.bloc<CongressBloc>();

  BehaviorSubject<bool> _mustSelectCongressController = BehaviorSubject<bool>();
  Stream<bool> get mustSelectCongressOut =>
      _mustSelectCongressController.stream;
  Sink<bool> get _mustSelectCongressIn => _mustSelectCongressController.sink;

  HomeBloc() {
    getSelectedCongress();
  }

  void getSelectedCongress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(_congressBloc.currentCongressKey)) {
      _mustSelectCongressIn.add(true);
    }
  }

  @override
  void dispose() {
    _mustSelectCongressController.close();
    super.dispose();
  }
}
