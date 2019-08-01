import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/lecture_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDateList extends StatelessWidget {
  final String date;

  const ScheduleDateList({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lectures = Provider.of<List<Lecture>>(context);

    // TODO: Change this to ListView.builder

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        if (lectures == null)
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32.0),
            child: CircularProgressIndicator(),
          ),
        if (lectures != null)
          for (var lecture in lectures) ...[
            LectureItem(lecture: lecture),
            if (lectures.last != lecture) Divider(),
          ]
      ],
    );
  }
}
