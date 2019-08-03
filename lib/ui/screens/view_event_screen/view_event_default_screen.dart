import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:flutter/material.dart';

class ViewEventDefaultScreen extends StatelessWidget {
  final String event;

  const ViewEventDefaultScreen({Key key, @required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getEventColor(event),
        title: Text(
          event,
          style: Styles.appBarPageTitleText.apply(color: Colors.white),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      // TODO: Replace ListView with slivers
      body: ListView(children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Hero(
            tag: event,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/banner_$event.jpg"),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
