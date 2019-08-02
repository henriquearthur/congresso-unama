import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventFilter with ChangeNotifier {
  List<String> _events;

  EventFilter(this._events);

  List<String> get events => _events;

  void add(String event) {
    if (!_events.contains(event)) {
      _events.add(event);
      _updateSharedPreferences();

      notifyListeners();
    } else {
      print(
          "[Warning] Event '$event' can't be added on the EventFilter because it already exists.");
    }
  }

  void remove(String event) {
    _events.remove(event);
    _updateSharedPreferences();

    notifyListeners();
  }

  _updateSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("schedule_filter_event", _events);
  }

  bool exists(String event) {
    return _events.contains(event);
  }

  int total() {
    return _events.length;
  }
}
