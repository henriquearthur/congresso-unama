import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/app/pages/view_lecture/view_lecture_module.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

class LectureBox extends StatelessWidget {
  final Lecture lecture;
  final bool separator;

  const LectureBox({Key key, this.lecture, this.separator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ViewLectureModule(
                  lecture: lecture,
                ),
              ),
            );
          },
          child: Opacity(
            opacity: (DateTime.now().isAfter(lecture.hourEnd)) ? 0.5 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "${lecture.hourStart.hour.toString().padLeft(2, '0')}h${lecture.hourStart.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(
                            color: Styles.primaryColor, fontSize: 18.0),
                      ),
                      const SizedBox(height: 5.0),
                      const Text("até"),
                      const SizedBox(height: 5.0),
                      Text(
                        "${lecture.hourEnd.hour.toString().padLeft(2, '0')}h${lecture.hourEnd.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(
                            color: Styles.primaryColor, fontSize: 18.0),
                      ),
                      if (DateTime.now().isAfter(lecture.hourStart) &&
                          DateTime.now().isBefore(lecture.hourEnd))
                        Chip(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(0),
                          label: Text(
                            "agora!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: Styles.primaryFontSemiboldWeight,
                              fontSize: 12,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      if (lecture.speakerImg != "") ...[
                        const SizedBox(height: 10.0),
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(60.0),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Image.asset(
                              'assets/images/placeholder.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                            imageUrl: lecture.speakerImg,
                            height: 60.0,
                            width: 60.0,
                          ),
                        )
                      ]
                    ],
                  ),
                  const SizedBox(width: 30.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          lecture.title,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18.0,
                            fontWeight: Styles.primaryFontMediumWeight,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        if (lecture.speakerName.isNotEmpty) ...[
                          Text(
                            lecture.speakerName,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: Styles.primaryFontMediumWeight,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                        if (lecture.description.isNotEmpty) ...[
                          Text(
                            lecture.description,
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                        if (lecture.tag != null)
                          Chip(
                            label: Text(
                              lecture.tag,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            backgroundColor: Styles.primaryColor,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (separator) Divider(),
      ],
    );
  }
}
