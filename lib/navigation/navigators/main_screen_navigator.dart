import 'package:congresso_unama/ui/screens/main_screen/main_default_screen.dart';
import 'package:flutter/material.dart';

class MainScreenNavigator extends StatelessWidget {
  final Key navigatorKey;

  const MainScreenNavigator({Key key, this.navigatorKey}) : super(key: key);

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
                screen = MainDefaultScreen();
            }

            return screen;
          },
        );
      },
    );
  }
}
