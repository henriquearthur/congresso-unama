import 'package:congresso_unama/ui/screens/location_screen/location_default_screen.dart';
import 'package:flutter/material.dart';

class LocationScreenNavigator extends StatelessWidget {
  final Key navigatorKey;

  const LocationScreenNavigator({Key key, this.navigatorKey}) : super(key: key);

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
