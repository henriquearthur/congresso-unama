import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:flutter/material.dart';

import 'components/lecture_box.dart';

class LecturesListPage extends StatelessWidget {
  final List<Lecture> lectures;
  final DateTime date;

  const LecturesListPage({Key key, this.lectures, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverOverlapInjector(
          // This is the flip side of the SliverOverlapAbsorber above.
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
  }
}
