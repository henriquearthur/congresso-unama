import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_congress_color.dart';
import 'package:congresso_unama/ui/utils/get_congress_name.dart';
import 'package:flutter/material.dart';

class LectureItem extends StatelessWidget {
  final Lecture lecture;
  final bool separator;

  const LectureItem({Key key, this.lecture, this.separator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/view-lecture", arguments: {'lecture': lecture});
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      lecture.hourStart,
                      style:
                          TextStyle(color: Styles.primaryColor, fontSize: 18.0),
                    ),
                    SizedBox(height: 5.0),
                    Text("até"),
                    SizedBox(height: 5.0),
                    Text(
                      lecture.hourEnd,
                      style:
                          TextStyle(color: Styles.primaryColor, fontSize: 18.0),
                    ),
                    if (lecture.speakerImg != "") ...[
                      SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(60.0),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Image.asset(
                              'assets/images/placeholder.png',
                              width: 60.0,
                              height: 60.0),
                          imageUrl: lecture.speakerImg,
                          height: 60.0,
                          width: 60.0,
                        ),
                      )
                    ]
                  ],
                ),
                SizedBox(width: 30.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        lecture.title,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        lecture.type +
                            ((lecture.speaker.isNotEmpty)
                                ? ' - ' + lecture.speaker
                                : ''),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Chip(
                        label: Text(
                          getCongressName(lecture.congress),
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: getCongressColor(lecture.congress),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (separator) Divider(),
      ],
    );
  }
}
