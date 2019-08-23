import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_date_list.dart';
import 'package:congresso_unama/ui/shared_components/fab_open_filter.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class ScheduleDefaultScreen extends StatefulWidget {
  @override
  _ScheduleDefaultScreenState createState() => _ScheduleDefaultScreenState();
}

class _ScheduleDefaultScreenState extends State<ScheduleDefaultScreen> {
  final dates = ["25-10-2018", "26-10-2018", "27-10-2018"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    backgroundColor: Styles.primaryColor,
                    title: Text(
                      'Programação',
                      style: Styles.appBarTitleText,
                    ),
                    iconTheme: IconThemeData(color: Styles.appBarIconColor),
                    centerTitle: true,
                    floating: true,
                    pinned: true,
                    snap: true,
                    primary: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      labelColor: Styles.appBarLabelColor,
                      tabs: [
                        Tab(text: "Dia 25"),
                        Tab(text: "Dia 26"),
                        Tab(text: "Dia 27"),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: dates.map((date) {
              return SafeArea(
                top: false,
                bottom: false,
                child: ScheduleDateList(date: date),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FabOpenFilter(),
    );
  }
}
