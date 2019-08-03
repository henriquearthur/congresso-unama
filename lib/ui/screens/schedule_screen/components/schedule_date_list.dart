import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/providers/event_filter.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/lecture_item.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/schedule_loading_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDateList extends StatefulWidget {
  final String date;

  const ScheduleDateList({Key key, this.date}) : super(key: key);

  @override
  _ScheduleDateListState createState() => _ScheduleDateListState();
}

class _ScheduleDateListState extends State<ScheduleDateList> {
  List<Lecture> _filteredLectures = [];

  @override
  void initState() {
    super.initState();

    _filteredLectures = _getFilteredLectures();
  }

  List<Lecture> _getFilteredLectures() {
    print("_getFilteredLectures");

    List<Lecture> lectures = Provider.of<List<Lecture>>(context, listen: false);
    EventFilter eventFilter = Provider.of<EventFilter>(context, listen: false);

    List<Lecture> filteredLectures = [];

    for (var lecture in lectures) {
      if (eventFilter.exists(lecture.event) && lecture.date == widget.date) {
        filteredLectures.add(lecture);
      }
    }

    return filteredLectures;
  }

  _buildListItem(BuildContext context, Lecture lecture) {
    return LectureItem(lecture: lecture);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: PageStorageKey("ScheduleDateList-${widget.date}"),
      separatorBuilder: (context, index) => Divider(height: 0.0),
      itemCount: _filteredLectures.length,
      itemBuilder: (context, index) =>
          _buildListItem(context, _filteredLectures[index]),
    );
  }
}
