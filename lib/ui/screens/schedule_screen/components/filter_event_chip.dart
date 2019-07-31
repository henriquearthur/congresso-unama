import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterEventChip extends StatefulWidget {
  final String event;

  const FilterEventChip({Key key, this.event}) : super(key: key);

  @override
  _FilterEventChipState createState() => _FilterEventChipState();
}

class _FilterEventChipState extends State<FilterEventChip> {
  bool _selected = true;

  Future<Null> configureSavedFilters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // if 'schedule_filter_event' doesn't exists the user is here for the first time. show all events then.
    if (!prefs.containsKey('schedule_filter_event')) {
      setState(() {
        _selected = true;
      });

      await prefs.setStringList(
          "schedule_filter_event", ["arquitetura", "computacao", "engenharia"]);
    } else {
      List<String> filters = prefs.getStringList("schedule_filter_event") ?? [];

      setState(() {
        _selected = filters.contains(widget.event);
      });
    }
  }

  @override
  void initState() {
    configureSavedFilters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        getEventName(widget.event),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: getEventColor(widget.event).withAlpha(150),
      selectedColor: getEventColor(widget.event),
      selected: _selected,
      onSelected: (bool value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> filters =
            prefs.getStringList("schedule_filter_event") ?? [];

        if (value) {
          filters.add(widget.event);

          setState(() {
            _selected = value;
          });
        } else {
          if (filters.length > 1) {
            filters.removeWhere((String name) {
              return name == widget.event;
            });

            setState(() {
              _selected = value;
            });
          }
        }

        await prefs.setStringList("schedule_filter_event", filters);
      },
    );
  }
}
