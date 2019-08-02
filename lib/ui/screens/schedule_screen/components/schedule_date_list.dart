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

  _buildListItem(BuildContext context, Lecture lecture) {
    return LectureItem(lecture: lecture);
  }

  static List<Lecture> _filterLectures(data) {
    List<Lecture> lectures = data[0];
    EventFilter eventFilter = data[1];

    List<Lecture> filteredLectures = [];

    print(eventFilter.events);

    for (var lecture in lectures) {
      filteredLectures.add(lecture);
    }

    return filteredLectures;
  }

  @override
  Widget build(BuildContext context) {
    List<Lecture> lectures = Provider.of<List<Lecture>>(context);
    EventFilter eventFilter = Provider.of<EventFilter>(context);

    if (lectures == null || eventFilter == null) {
      return ScheduleLoadingList();
    } else {
      var filteredLectures = _filterLectures([lectures, eventFilter]);

      return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) =>
              _buildListItem(context, filteredLectures[index]));
    }
  }
}
