import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class LectureItem extends StatelessWidget {
  final Lecture lecture;

  const LectureItem({Key key, this.lecture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              lecture.hourStart,
              style:
                  TextStyle(color: Styles.scheduleScreenColor, fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text("até"),
            SizedBox(height: 5.0),
            Text(lecture.hourEnd,
                style: TextStyle(
                    color: Styles.scheduleScreenColor, fontSize: 18.0)),
          ],
        ),
        SizedBox(width: 20.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(lecture.title),
              Text(lecture.speaker),
              Chip(
                label: Text(lecture.event),
                backgroundColor: (lecture.event == "arquitetura")
                    ? Styles.architectureColor
                    : ((lecture.event == "computacao")
                        ? Styles.computingColor
                        : Styles.engineeringColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
