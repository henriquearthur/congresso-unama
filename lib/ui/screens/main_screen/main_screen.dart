import 'package:congresso_unama/ui/screens/main_screen/main_screen_content.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
                screen = MainScreenContent();
            }

            return screen;
          },
        );
      },
    );
  }
}
