import 'package:congresso_unama/providers/event_filter.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterEventChip extends StatelessWidget {
  final String event;

  const FilterEventChip({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventFilter eventFilter = Provider.of<EventFilter>(context);

    return FilterChip(
      label: Text(
        getEventName(event),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: getEventColor(event).withAlpha(150),
      selectedColor: getEventColor(event),
      selected: eventFilter.exists(event),
      onSelected: (bool value) {
        if (value) {
          eventFilter.add(event);
        } else {
          if (eventFilter.total() > 1) {
            eventFilter.remove(event);
          }
        }
      },
    );
  }
}
