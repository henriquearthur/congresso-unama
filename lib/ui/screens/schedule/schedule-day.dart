import 'package:congresso_unama/ui/screens/schedule/schedule-item.dart';
import 'package:flutter/material.dart';

class ScheduleDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        ScheduleItem(
          hourStart: "15h00",
          hourEnd: "20h00",
          title: "Credenciamento",
        ),
        ScheduleItem(
          hourStart: "18h00",
          hourEnd: "19h00",
          title: "Cerimônia de Abertura",
          description: "Palestra de Abertura - Palestra Magna",
        )
      ],
    );
  }
}
