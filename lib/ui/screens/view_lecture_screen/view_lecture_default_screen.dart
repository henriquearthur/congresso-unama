import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ViewLectureDefaultScreen extends StatelessWidget {
  final Lecture lecture;

  const ViewLectureDefaultScreen({Key key, @required this.lecture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lecture.congress.color,
        title: Text(
          lecture.type,
          style: Styles.appBarPageTitleText,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (lecture.speaker.isNotEmpty) {
                Share.share(
                    "Confira ${lecture.title} no ${lecture.congress.name} de ${lecture.hourStart} até ${lecture.hourEnd} com ${lecture.speaker}! Saiba mais em ${lecture.congress.link}");
              } else {
                Share.share(
                    "Confira ${lecture.title} no ${lecture.congress.name} de ${lecture.hourStart} até ${lecture.hourEnd}! Saiba mais em ${lecture.congress.link}");
              }
            },
            icon: Icon(Icons.share),
          )
        ],
        iconTheme: IconThemeData(color: Styles.appBarPageIconColor),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: lecture.congress.color,
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              lecture.title,
              style: TextStyle(
                color: lecture.congress.color,
                fontSize: 26.0,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${lecture.type} - ${lecture.local}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              lecture.getFullDate(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  lecture.hourStart,
                  style:
                      TextStyle(color: lecture.congress.color, fontSize: 24.0),
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
                  style:
                      TextStyle(color: lecture.congress.color, fontSize: 24.0),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(
                  lecture.congress.shortName,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: lecture.congress.color,
              ),
            ),
            Divider(),
            if (lecture.speakerImg != "") ...[
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromARGB(100, 0, 0, 0),
                        offset: Offset(0.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(120.0),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                          'assets/images/placeholder.png',
                          width: 120.0,
                          height: 120.0),
                      imageUrl: lecture.speakerImg,
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                ),
              )
            ],
            if (lecture.speaker.isNotEmpty) ...[
              SizedBox(height: 20.0),
              Text(
                lecture.speaker,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (lecture.speakerDetails.isNotEmpty) SizedBox(height: 15.0),
              Text(
                lecture.speakerDetails,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
