import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_event_chip.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class FilterEventsBottomSheet extends StatelessWidget {
  final events = ["arquitetura", "computacao", "engenharia"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Filtrar por área",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 22.0,
                  letterSpacing: -1.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            "Toque em uma ou mais áreas para visualizar apenas as palestras que lhe interessam.",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              for (var event in events) FilterEventChip(event: event),
            ],
          )
        ],
      ),
    );
  }
}
