import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterEventChip extends StatefulWidget {
  final String event;

  const FilterEventChip({Key key, this.event}) : super(key: key);

  @override
  _FilterEventChipState createState() => _FilterEventChipState();
}

class _FilterEventChipState extends State<FilterEventChip> {
  final Map eventNames = {
    "arquitetura": "3° Congresso de Arquitetura e Urbanismo",
    "computacao": "3º Congresso de Informática",
    "engenharia": "3º Congresso de Engenharia",
  };

  bool _selected = true;

  Future<Null> getSavedFilters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> filters = prefs.getStringList("schedule_filter_event") ?? [];

    setState(() {
      _selected = filters.contains(widget.event);
    });
  }

  @override
  void initState() {
    getSavedFilters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        eventNames[widget.event],
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: getEventColor(widget.event).withAlpha(150),
      selectedColor: getEventColor(widget.event),
      selected: _selected,
      onSelected: (bool value) async {
        setState(() {
          _selected = value;
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> filters =
            prefs.getStringList("schedule_filter_event") ?? [];

        if (value) {
          filters.add(widget.event);
        } else {
          filters.removeWhere((String name) {
            return name == widget.event;
          });
        }

        await prefs.setStringList("schedule_filter_event", filters);
      },
    );
  }
}
