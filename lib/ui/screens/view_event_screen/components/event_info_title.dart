import 'package:flutter/material.dart';

class EventInfoTitle extends StatelessWidget {
  final String title;

  const EventInfoTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
