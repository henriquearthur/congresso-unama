import 'package:congresso_unama/ui/screens/location_screen/location_screen_content.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
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
                screen = LocationScreenContent();
            }

            return screen;
          },
        );
      },
    );
  }
}
