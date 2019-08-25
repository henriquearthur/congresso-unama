import 'package:congresso_unama/ui/screens/location_screen/location_default_screen.dart';
import 'package:congresso_unama/ui/screens/main_screen/main_default_screen.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/view_event_default_screen.dart';
import 'package:flutter/material.dart';

class MainScreenNavigator extends StatelessWidget {
  final Key navigatorKey;

  const MainScreenNavigator({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        Map args = settings.arguments;

        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            Widget screen;

            switch (settings.name) {
              case '/':
                screen = MainDefaultScreen();
                break;

              case '/view-event':
                screen = ViewEventDefaultScreen(
                  congress: args['event'],
                );
                break;

              case '/view-location':
                screen = LocationDefaultScreen();
                break;
            }

            return screen;
          },
        );
      },
    );
  }
}
