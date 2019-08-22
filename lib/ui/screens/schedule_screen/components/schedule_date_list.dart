import 'package:congresso_unama/blocs/congress_filter/bloc.dart';
import 'package:congresso_unama/blocs/schedule/bloc.dart';
import 'package:congresso_unama/repositories/lecture_repository.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/lecture_item.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_loading_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDateList extends StatelessWidget {
  final String date;

  const ScheduleDateList({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        ScheduleBloc scheduleBloc = ScheduleBloc(
          lectureRepository: LectureRepository(),
          filterBloc: BlocProvider.of<CongressFilterBloc>(context),
          date: date,
        );

        scheduleBloc.dispatch(LoadSchedule());

        return scheduleBloc;
      },
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is InitialScheduleState) {
            return ScheduleLoadingList();
          } else if (state is LoadingScheduleState) {
            return ScheduleLoadingList();
          } else if (state is LoadedScheduleState) {
            return CustomScrollView(
              key: PageStorageKey<String>(date),
              slivers: <Widget>[
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
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
