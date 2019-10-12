import 'dart:async';

import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_bloc.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_module.dart';
import 'package:congresso_unama/app/shared/blocs/congress_bloc.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:flutter/material.dart';

import 'lecture_box.dart';

class LecturesList extends StatefulWidget {
  final DateTime date;

  LecturesList({Key key, this.date}) : super(key: key);

  @override
  _LecturesListState createState() => _LecturesListState();
}

class _LecturesListState extends State<LecturesList> {
  final _congressBloc = AppModule.to.getBloc<CongressBloc>();
  final ScheduleBloc _scheduleBloc = ScheduleModule.to.getBloc<ScheduleBloc>();
  StreamSubscription _congressSubscription;

  @override
  void initState() {
    super.initState();
    _congressSubscription = _congressBloc.congressOut
        .listen((congress) => _scheduleBloc.getLectures(congress, widget.date));
  }

  @override
  void dispose() {
    _congressSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _scheduleBloc.lecturesListOut,
      builder: (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
        if (snapshot.hasData) {
          var lectures = snapshot.data;

          return CustomScrollView(
            key: PageStorageKey<DateTime>(widget.date),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return LectureBox(
                      lecture: lectures[index],
                      separator: (index < lectures.length - 1),
                    );
                  },
                  childCount: lectures.length,
                ),
              )
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 32.0),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
