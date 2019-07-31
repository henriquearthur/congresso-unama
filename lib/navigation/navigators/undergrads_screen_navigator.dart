import 'package:congresso_unama/ui/screens/undergrads_screen/undergrads_default_screen.dart';
import 'package:flutter/material.dart';

class UndergradsScreenNavigator extends StatelessWidget {
  final Key navigatorKey;

  const UndergradsScreenNavigator({Key key, this.navigatorKey})
      : super(key: key);

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
                screen = UndergradsDefaultScreen();
            }

            return screen;
          },
        );
      },
    );
  }
}
