import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/blocs/schedule/bloc.dart';
import 'package:congresso_unama/repositories/lecture_repository.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/lecture_item.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_loading_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDateList extends StatelessWidget {
  final DateTime date;

  const ScheduleDateList({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        String dateString =
            '${date.day.toString().padLeft(2, "0")}-${date.month.toString().padLeft(2, "0")}-${date.year}';

        ScheduleBloc scheduleBloc = ScheduleBloc(
          lectureRepository: LectureRepository(),
          filterBloc: BlocProvider.of<CongressFilterBloc>(context),
          date: dateString,
        );

        scheduleBloc.dispatch(LoadSchedule());

        return scheduleBloc;
      },
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is LoadedScheduleState) {
            return CustomScrollView(
              key: PageStorageKey<DateTime>(date),
              slivers: <Widget>[
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                if (state.lectures.isEmpty)
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Container(
                            child: Text(
                              "Ainda não há programação para este dia.",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                if (state.lectures.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return LectureItem(
                          lecture: state.lectures[index],
                          separator: (index < state.lectures.length - 1),
                        );
                      },
                      childCount: state.lectures.length,
                    ),
                  )
              ],
            );
          }

          return ScheduleLoadingList();
        },
      ),
    );
  }
}
