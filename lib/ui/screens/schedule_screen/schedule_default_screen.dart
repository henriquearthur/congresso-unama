import 'package:congresso_unama/blocs/congress/bloc.dart';
import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/shared_components/fab_open_filter.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDefaultScreen extends StatefulWidget {
  @override
  _ScheduleDefaultScreenState createState() => _ScheduleDefaultScreenState();
}

class _ScheduleDefaultScreenState extends State<ScheduleDefaultScreen> {
  List<DateTime> dates = [];

  List<DateTime> getIntervalDates(String start, String end) {
    if (dates.length == 0) {
      List<String> startArr = start.split('-');
      int startDay = int.parse(startArr[0]);
      int startMonth = int.parse(startArr[1]);
      int startYear = int.parse(startArr[2]);

      List<String> endArr = end.split('-');
      int endDay = int.parse(endArr[0]);
      int endMonth = int.parse(endArr[1]);
      int endYear = int.parse(endArr[2]);

      DateTime startDate = DateTime.utc(startYear, startMonth, startDay);
      DateTime endDate = DateTime.utc(endYear, endMonth, endDay);

      DateTime currentDate = startDate;

      while (currentDate.microsecondsSinceEpoch <=
          endDate.microsecondsSinceEpoch) {
        dates.add(currentDate);
        currentDate = currentDate.add(Duration(days: 1));
      }
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          if (state is LoadedInformationState) {
            return DefaultTabController(
              length: getIntervalDates(
                      state.information.dateStart, state.information.dateEnd)
                  .length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                            tabs: getIntervalDates(state.information.dateStart,
                                    state.information.dateEnd)
                                .map((date) {
                              return Tab(text: "Dia ${date.day}");
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: getIntervalDates(state.information.dateStart,
                          state.information.dateEnd)
                      .map((date) {
                    return SafeArea(
                      top: false,
                      bottom: false,
                      child: ScheduleDateList(date: date),
                    );
                  }).toList(),
                ),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: BlocBuilder<CongressBloc, CongressState>(
        builder: (context, state) {
          if (state is LoadedCongressListState && state.congresses.length > 1) {
            return FabOpenFilter();
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
