import 'package:flutter/material.dart';

class Destination {
  Destination(this.index, this.title, this.icon);

  final int index;
  final String title;
  final IconData icon;
}

List<Destination> allDestinations = <Destination>[
  Destination(0, 'Home', Icons.home),
  Destination(1, 'Programação', Icons.calendar_today),
  Destination(2, 'Trabalhos', Icons.school),
];
