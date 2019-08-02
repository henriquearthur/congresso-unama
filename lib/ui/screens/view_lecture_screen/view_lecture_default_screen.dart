import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_name.dart';
import 'package:flutter/material.dart';

class ViewLectureDefaultScreen extends StatelessWidget {
  final Lecture lecture;

  const ViewLectureDefaultScreen({Key key, @required this.lecture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.appBarPageBackgroundColor,
        title: Text(
          lecture.type,
          style: Styles.appBarPageTitleText,
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Styles.appBarPageIconColor),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            lecture.title,
            style: TextStyle(
              color: getEventColor(lecture.event),
              fontSize: 26.0,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            lecture.type,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                lecture.hourStart,
                style: TextStyle(
                    color: getEventColor(lecture.event), fontSize: 24.0),
              ),
              SizedBox(width: 8.0),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "até",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                lecture.hourEnd,
                style: TextStyle(
                    color: getEventColor(lecture.event), fontSize: 24.0),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Chip(
              label: Text(
                getEventName(lecture.event),
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: getEventColor(lecture.event),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
