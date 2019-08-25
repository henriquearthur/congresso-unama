import 'package:congresso_unama/navigation/destination/destination.dart';
import 'package:congresso_unama/navigation/navigators/main_screen_navigator.dart';
import 'package:congresso_unama/navigation/navigators/schedule_screen_navigator.dart';
import 'package:congresso_unama/navigation/navigators/undergrads_screen_navigator.dart';
import 'package:flutter/material.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.navigatorKey})
      : super(key: key);

  final Destination destination;
  final Key navigatorKey;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (widget.destination.index) {
      case 0:
        screen = MainScreenNavigator(navigatorKey: widget.navigatorKey);
        break;

      case 1:
        screen = ScheduleScreenNavigator(navigatorKey: widget.navigatorKey);
        break;

      case 2:
        screen = UndergradsScreenNavigator(navigatorKey: widget.navigatorKey);
        break;
    }

    return screen;
  }
}
