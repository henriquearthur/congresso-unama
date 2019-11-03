import 'package:flutter/material.dart';

import 'filter_lectures_bottom_sheet.dart';

class FabOpenFilter extends StatefulWidget {
  final List<String> tags;

  const FabOpenFilter({Key key, this.tags}) : super(key: key);

  @override
  _FabOpenFilterState createState() => _FabOpenFilterState();
}

class _FabOpenFilterState extends State<FabOpenFilter> {
  void _openFilterSchedule() {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => FilterLecturesBottomSheet(tags: widget.tags),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _openFilterSchedule,
      icon: Icon(Icons.filter_list),
      label: Text("Filtrar", style: TextStyle(letterSpacing: 0)),
    );
  }
}
