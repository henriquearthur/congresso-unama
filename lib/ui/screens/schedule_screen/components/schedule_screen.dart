import 'package:congresso_unama/blocs/congress_schedule_filter/congress_schedule_filter_bloc.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_events_bottom_sheet.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

  void _openFilterSchedule() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return FilterEventsBottomSheet();
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
          backgroundColor: Colors.white,
          title: Text(
            'Programação',
            style: Styles.appBarTitleText,
          ),
          iconTheme: IconThemeData(color: Styles.appBarIconColor),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
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
