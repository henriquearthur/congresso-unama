import 'package:flutter/material.dart';

class EventDataLoading extends StatelessWidget {
  final Color color;

  const EventDataLoading({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
