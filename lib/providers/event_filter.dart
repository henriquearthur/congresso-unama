import 'package:flutter/material.dart';

class EventFilter with ChangeNotifier {
  List<String> _events;

  EventFilter(this._events);

  List<String> get events => _events;

  void add(String event) {
    if (!_events.contains(event)) {
      _events.add(event);
      notifyListeners();
    } else {
      print(
          "[Warning] Event '$event' can't be added on the EventFilter because it already exists.");
    }
  }

  void remove(String event) {
    _events.remove(event);
    notifyListeners();
  }

  bool exists(String event) {
    return _events.contains(event);
  }

  int total() {
    return _events.length;
  }
}
