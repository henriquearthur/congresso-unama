import 'dart:async';

import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/providers/event_filter.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_events_bottom_sheet.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_loading_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleDefaultScreen extends StatefulWidget {
  @override
  _ScheduleDefaultScreenState createState() => _ScheduleDefaultScreenState();
}

class _ScheduleDefaultScreenState extends State<ScheduleDefaultScreen>
    with SingleTickerProviderStateMixin {
  // final db = DatabaseService();
  Stream<List<Lecture>> _stream;
  Future<List<String>> _savedFilteredEvents;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _bottomSheetController;

  TabController _tabController;

  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

  @override
  void initState() {
    super.initState();

    _savedFilteredEvents = _getSavedFilteredEvents();
    // _stream = db.streamLectures();
    _tabController = TabController(length: dates.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _stream = null;

    super.dispose();
  }

  Future<List<String>> _getSavedFilteredEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> filters = prefs.getStringList("schedule_filter_event") ??
        ['arquitetura', 'computacao', 'engenharia'];

    return filters;
  }

  void _filterSchedule() {
    if (_bottomSheetController != null) {
      _bottomSheetController.close();
    } else {
      _bottomSheetController =
          _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
        return FilterEventsBottomSheet();
      });

      _bottomSheetController.closed.then((value) {
        _bottomSheetController = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _savedFilteredEvents,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ScheduleLoadingList();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ChangeNotifierProvider<EventFilter>(
                builder: (_) => EventFilter(snapshot.data),
                child: Scaffold(
                  key: _scaffoldKey,
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
                      controller: _tabController,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "Dia 25"),
                        Tab(text: "Dia 26"),
                        Tab(text: "Dia 27"),
                      ],
                    ),
                  ),
                  body: StreamBuilder(
                    stream: _stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ScheduleLoadingList();
                      } else {
                        if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (!snapshot.hasData) {
                          return ScheduleLoadingList();
                        } else {
                          return Provider<List<Lecture>>.value(
                            value: snapshot.data,
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                for (var date in dates)
                                  ScheduleDateList(date: date),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: _filterSchedule,
                    child: Icon(Icons.filter_list),
                  ),
                ),
              );
            }
          }
        });
  }
}
