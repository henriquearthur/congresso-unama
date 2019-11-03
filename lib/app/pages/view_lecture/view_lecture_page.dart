import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/app/shared/components/admob_banner_ad.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ViewLecturePage extends StatelessWidget {
  final Lecture lecture;

  const ViewLecturePage({Key key, this.lecture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: Text(
          lecture.type,
          style: Styles.appBarPageTitleText,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (lecture.speakerName.isNotEmpty) {
                Share.share(
                    "Confira ${lecture.title} no ${lecture.congress.title} de ${lecture.hourStart} até ${lecture.hourEnd} com ${lecture.speakerName}! Saiba mais em ${lecture.congress.link}");
              } else {
                Share.share(
                    "Confira ${lecture.title} no ${lecture.congress.title} de ${lecture.hourStart} até ${lecture.hourEnd}! Saiba mais em ${lecture.congress.link}");
              }
            },
            icon: Icon(Icons.share),
          )
        ],
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Styles.primaryColor,
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              lecture.title,
              style: TextStyle(
                color: Styles.primaryColor,
                fontSize: 22.0,
                letterSpacing: -0.5,
                fontWeight: Styles.primaryFontMediumWeight,
              ),
            ),
            Text(
              "${lecture.type}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            if (lecture.description.isNotEmpty) ...[
              const SizedBox(height: 10.0),
              Text(
                "${lecture.description}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
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
                  style: TextStyle(color: Styles.primaryColor, fontSize: 24.0),
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
                  style: TextStyle(color: Styles.primaryColor, fontSize: 24.0),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(
                  lecture.congress.title,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: Styles.primaryFontMediumWeight,
                  ),
                ),
                backgroundColor: Styles.primaryColor,
              ),
            ),
            if (lecture.tag != null)
              Align(
                alignment: Alignment.topLeft,
                child: Chip(
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
            if (lecture.speakerName.isNotEmpty) ...[
              SizedBox(height: 20.0),
              Text(
                lecture.speakerName,
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
            Center(
              child: const AdmobBannerAd(
                adUnit: 'ca-app-pub-6254443832700241/3634347279',
              ),
            )
          ],
        ),
      ),
    );
  }
}
