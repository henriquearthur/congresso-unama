import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_events_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FabOpenFilter extends StatefulWidget {
  @override
  _FabOpenFilterState createState() => _FabOpenFilterState();
}

class _FabOpenFilterState extends State<FabOpenFilter> {
  void _openFilterSchedule() {
    final congressFilterBloc = BlocProvider.of<CongressFilterBloc>(context);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: congressFilterBloc,
          child: FilterEventsBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _openFilterSchedule,
      icon: Icon(Icons.filter_list),
      label: Text(
        "Filtrar",
        style: TextStyle(letterSpacing: 0.0),
      ),
    );
  }
}
