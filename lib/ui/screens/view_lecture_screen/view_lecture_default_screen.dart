import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class ViewLectureDefaultScreen extends StatelessWidget {
  final Lecture lecture;

  const ViewLectureDefaultScreen({Key key, @required this.lecture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.appBarBackgroundColor,
        title: Text(
          'Teste',
          style: Styles.appBarTitleText,
        ),
        iconTheme: IconThemeData(color: Styles.appBarIconColor),
        centerTitle: true,
      ),
    );
  }
}
