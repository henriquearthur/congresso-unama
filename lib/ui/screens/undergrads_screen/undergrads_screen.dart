import 'package:congresso_unama/ui/screens/undergrads_screen/undergrads_screen_content.dart';
import 'package:flutter/material.dart';

class UndergradsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            Widget screen;

            switch (settings.name) {
              case '/':
                screen = UndergradsScreenContent();
            }

            return screen;
          },
        );
      },
    );
  }
}
