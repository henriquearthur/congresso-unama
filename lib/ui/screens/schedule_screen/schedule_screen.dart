import 'package:congresso_unama/ui/screens/schedule_screen/schedule_screen_content.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
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
                screen = ScheduleScreenContent();
            }

            return screen;
          },
        );
      },
    );
  }
}
