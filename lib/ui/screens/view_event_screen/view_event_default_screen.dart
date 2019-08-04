import 'package:congresso_unama/models/event.dart';
import 'package:congresso_unama/models/speaker.dart';
import 'package:congresso_unama/services/database_service.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_name.dart';
import 'package:congresso_unama/ui/utils/get_event_short_name.dart';
import 'package:flutter/material.dart';

class ViewEventDefaultScreen extends StatefulWidget {
  final String event;

  const ViewEventDefaultScreen({Key key, @required this.event})
      : super(key: key);

  @override
  _ViewEventDefaultScreenState createState() => _ViewEventDefaultScreenState();
}

class _ViewEventDefaultScreenState extends State<ViewEventDefaultScreen> {
  final db = DatabaseService();
  Stream<Event> _streamEventData;
  Stream<List<Speaker>> _streamEventSpeakers;

  @override
  void initState() {
    super.initState();

    _streamEventData = db.streamEventData(widget.event);
    _streamEventSpeakers = db.streamEventSpeakers(widget.event);
  }

  @override
  void dispose() {
    _streamEventData = null;
    _streamEventSpeakers = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getEventColor(widget.event),
        title: Text(
          getEventShortName(widget.event),
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
            tag: widget.event,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/banner_${widget.event}.jpg"),
                ),
              ),
            ),
          ),
        ),
        // Divide below tree in Widgets and use Provider for the streams
        StreamBuilder(
          stream: _streamEventData,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshotEvent) {
            if (snapshotEvent.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            getEventColor(widget.event)))),
              );
            } else {
              if (snapshotEvent.hasError) {
                return Text("Error: ${snapshotEvent.error}");
              } else if (!snapshotEvent.hasData) {
                return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                getEventColor(widget.event)))));
              } else {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        snapshotEvent.data.description,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream: _streamEventSpeakers,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Speaker>> snapshotSpeaker) {
                        if (snapshotSpeaker.hasError) {
                          return Text("Error: ${snapshotEvent.error}");
                        } else if (snapshotSpeaker.hasData) {
                          return Column(
                            children: <Widget>[
                              for (Speaker speaker in snapshotSpeaker.data) ...[
                                Text(speaker.name),
                              ]
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                );
              }
            }
          },
        ),
      ]),
    );
  }
}
