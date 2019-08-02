import 'package:flutter/material.dart';

class ScheduleLoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 32.0),
      child: CircularProgressIndicator(),
    );
  }
}
