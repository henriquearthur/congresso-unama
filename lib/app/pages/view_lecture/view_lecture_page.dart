import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:flutter/material.dart';

class ViewLecturePage extends StatefulWidget {
  final Lecture lecture;

  const ViewLecturePage({Key key, @required this.lecture}) : super(key: key);

  @override
  _ViewLecturePageState createState() => _ViewLecturePageState();
}

class _ViewLecturePageState extends State<ViewLecturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewLecture"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
