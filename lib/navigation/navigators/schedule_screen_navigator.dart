import 'package:congresso_unama/ui/screens/schedule_screen/schedule_default_screen.dart';
import 'package:flutter/material.dart';

class ScheduleScreenNavigator extends StatelessWidget {
  final Key navigatorKey;

  const ScheduleScreenNavigator({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            Widget screen;

            switch (settings.name) {
              case '/':
                screen = ScheduleDefaultScreen();
            }

            return screen;
          },
        );
      },
    );
  }
}