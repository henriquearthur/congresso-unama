import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/providers/event_filter.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/lecture_item.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_loading_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDateList extends StatelessWidget {
  final String date;

  const ScheduleDateList({Key key, this.date}) : super(key: key);

  static List<Lecture> _filterLectures(context) {
    List<Lecture> lectures = Provider.of<List<Lecture>>(context);
    EventFilter eventFilter = Provider.of<EventFilter>(context);

    List<Lecture> filteredLectures = [];

    for (var lecture in lectures) {
      if (eventFilter.exists(lecture.event)) {
        filteredLectures.add(lecture);
      }
    }

    print(filteredLectures);

    return filteredLectures;
  }

  _buildListItem(BuildContext context, Lecture lecture) {
    return LectureItem(lecture: lecture);
  }

  @override
  Widget build(BuildContext context) {
    List<Lecture> lectures = Provider.of<List<Lecture>>(context);
    EventFilter eventFilter = Provider.of<EventFilter>(context);

    if (lectures == null || eventFilter == null) {
      return ScheduleLoadingList();
    } else {
      // TODO: do this in background
      var filteredLectures = _filterLectures(context);

      return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: filteredLectures.length,
          itemBuilder: (context, index) =>
              _buildListItem(context, filteredLectures[index]));
    }
  }
}
