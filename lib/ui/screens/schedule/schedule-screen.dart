import 'package:congresso_unama/ui/screens/schedule/schedule-day.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Programação',
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Dia 25",
              ),
              Tab(
                text: "Dia 26",
              ),
              Tab(
                text: "Dia 27",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ScheduleDay(),
            ScheduleDay(),
            ScheduleDay(),
          ],
        ),
      ),
    );
  }
}
