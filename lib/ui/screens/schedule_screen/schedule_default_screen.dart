import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/services/database_service.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_events_bottom_sheet.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDefaultScreen extends StatelessWidget {
  final db = DatabaseService();
  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

  void _filterSchedule(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return FilterEventsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Programação',
            style: Styles.appBarTitleText,
          ),
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
          children: [
            for (var date in dates)
              StreamProvider<List<Lecture>>.value(
                value: db.streamLectures(date),
                child: ScheduleDateList(date: date),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _filterSchedule(context);
          },
          child: Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
