import 'package:congresso_unama/providers/congress_filter.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_short_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterEventChip extends StatelessWidget {
  final String event;

  const FilterEventChip({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final congressFilter = Provider.of<CongressFilter>(context);

    return FilterChip(
      label: Text(
        getEventShortName(event),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: getEventColor(event).withAlpha(150),
      selectedColor: getEventColor(event),
      selected: congressFilter.exists(event),
      onSelected: (bool value) {
        if (value) {
          congressFilter.add(event);
        } else {
          if (congressFilter.total() > 1) {
            congressFilter.remove(event);
          }
        }
      },
    );
  }
}
