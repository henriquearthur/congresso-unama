import 'package:congresso_unama/ui/screens/location_screen/location_screen.dart';
import 'package:congresso_unama/ui/screens/main_screen/main_screen.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/schedule_screen.dart';
import 'package:congresso_unama/ui/screens/undergrads_screen/undergrads_screen.dart';
import 'package:flutter/material.dart';

class Destination {
  Destination(this.index, this.title, this.icon, this.screen);

  final int index;
  final String title;
  final IconData icon;
  final Widget screen;
}

List<Destination> allDestinations = <Destination>[
  Destination(0, 'Principal', Icons.home, MainScreen()),
  Destination(1, 'Programação', Icons.calendar_today, ScheduleScreen()),
  Destination(2, 'Trabalhos', Icons.school, UndergradsScreen()),
  Destination(3, 'Localização', Icons.location_on, LocationScreen())
];
