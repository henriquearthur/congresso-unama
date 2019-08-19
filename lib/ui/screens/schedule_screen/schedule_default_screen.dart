import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_events_bottom_sheet.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDefaultScreen extends StatefulWidget {
  @override
  _ScheduleDefaultScreenState createState() => _ScheduleDefaultScreenState();
}

class _ScheduleDefaultScreenState extends State<ScheduleDefaultScreen> {
  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // TODO: Change this to SliverAppBar (https://github.com/flutter/flutter/issues/19720)
        appBar: AppBar(
          backgroundColor: Styles.primaryColor,
          title: Text(
            'Programação',
            style: Styles.appBarTitleText,
          ),
          iconTheme: IconThemeData(color: Styles.appBarIconColor),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Styles.appBarLabelColor,
            tabs: [
              Tab(text: "Dia 25"),
              Tab(text: "Dia 26"),
              Tab(text: "Dia 27"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (var date in dates) ScheduleDateList(date: date),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openFilterSchedule,
          child: Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
