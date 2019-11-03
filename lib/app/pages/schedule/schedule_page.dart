import 'dart:async';

import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/pages/schedule/components/fab_open_filter.dart';
import 'package:congresso_unama/app/pages/schedule/schedule_bloc.dart';
import 'package:congresso_unama/app/shared/blocs/congress_bloc.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'lectures_list/lectures_list_bloc.dart';
import 'lectures_list/lectures_list_page.dart';
import 'schedule_module.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  final _congressBloc = AppModule.to.getBloc<CongressBloc>();
  final _scheduleBloc = ScheduleModule.to.getBloc<ScheduleBloc>();
  final _lecturesListBloc = ScheduleModule.to.getBloc<LecturesListBloc>();
  StreamSubscription _congressSubscription;

  Map<DateTime, Observable<List<Lecture>>> observables;

  @override
  void initState() {
    super.initState();

    _congressSubscription = _congressBloc.congressOut.listen((congress) {
      var intervalDates =
          getIntervalDates(congress.dateStart, congress.dateEnd);
      intervalDates
          .forEach((date) => _lecturesListBloc.fetchLectures(congress));
    });
  }

  @override
  void dispose() {
    _congressSubscription.cancel();
    super.dispose();
  }

  List<DateTime> getIntervalDates(DateTime startDate, DateTime endDate) {
    List<DateTime> intervalDates = [];
    DateTime currentDate = startDate;

    while (
        currentDate.microsecondsSinceEpoch <= endDate.microsecondsSinceEpoch) {
      intervalDates.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }

    return intervalDates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _congressBloc.congressOut,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var congress = snapshot.data;
            var intervalDates =
                getIntervalDates(congress.dateStart, congress.dateEnd);

            return DefaultTabController(
              length: intervalDates.length,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      child: SliverSafeArea(
                        top: false,
                        sliver: SliverAppBar(
                          backgroundColor: Styles.primaryColor,
                          title: Text(
                            'Programação',
                            style: Styles.appBarTitleText,
                          ),
                          iconTheme:
                              IconThemeData(color: Styles.appBarIconColor),
                          centerTitle: true,
                          floating: true,
                          pinned: true,
                          snap: true,
                          primary: true,
                          forceElevated: innerBoxIsScrolled,
                          bottom: TabBar(
                            labelColor: Styles.appBarLabelColor,
                            tabs: intervalDates
                                .map((date) => Tab(text: "Dia ${date.day}"))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: StreamBuilder(
                    stream: _lecturesListBloc.lecturesListOut,
                    builder: (context, AsyncSnapshot<List<Lecture>> snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder(
                          stream: _scheduleBloc.filterOut,
                          builder: (context,
                              AsyncSnapshot<List<String>> snapshotFilter) {
                            if (snapshotFilter.hasData) {
                              var tags = snapshotFilter.data;

                              return TabBarView(
                                children: intervalDates
                                    .map(
                                      (date) => SafeArea(
                                        top: false,
                                        bottom: false,
                                        key: PageStorageKey<DateTime>(date),
                                        child: LecturesListPage(
                                          date: date,
                                          lectures: snapshot.data
                                              .where((lecture) =>
                                                  lecture.date.day ==
                                                      date.day &&
                                                  lecture.date.month ==
                                                      date.month &&
                                                  lecture.date.year ==
                                                      date.year &&
                                                  (lecture.tag == null ||
                                                      tags.contains(
                                                          lecture.tag)))
                                              .toList(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            }

                            return Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 32.0),
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 32.0),
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppBar(
                backgroundColor: Styles.primaryColor,
                title: Text(
                  'Programação',
                  style: Styles.appBarTitleText,
                ),
                centerTitle: true,
              ),
              Center(child: CircularProgressIndicator()),
              SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: StreamBuilder(
        stream: _lecturesListBloc.lecturesListOut,
        builder: (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
          if (snapshot.hasData) {
            var lectures = snapshot.data;
            var tags = _scheduleBloc.extractTags(lectures);

            if (tags.isNotEmpty) {
              return FabOpenFilter(tags: tags);
            }
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
