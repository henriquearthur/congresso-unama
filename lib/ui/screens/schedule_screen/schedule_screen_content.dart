import 'package:congresso_unama/ui/screens/schedule_screen/schedule_day.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleScreenContent extends StatelessWidget {
  void _filterSchedule(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('Arquitetura e Urbanismo'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.build),
                  title: new Text('Engenharias'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.computer),
                  title: new Text('Informática'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

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
              Tab(text: "Dia 25"),
              Tab(text: "Dia 26"),
              Tab(text: "Dia 27"),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.filter_list),
          backgroundColor: Colors.green,
          onPressed: () => _filterSchedule(context),
        ),
      ),
    );
  }
}
