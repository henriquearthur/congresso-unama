import 'package:congresso_unama/app/shared/models/speaker.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'speaker_box_image.dart';

class SpeakerBox extends StatelessWidget {
  final Speaker speaker;

  const SpeakerBox({Key key, this.speaker}) : super(key: key);

  void _showDetails(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.grey[200],
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Center(
                    child: SpeakerBoxImage(
                      image: speaker.image,
                      size: 120.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Text(
                      speaker.name,
                      style: Styles.bottomSheetTitleText,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    speaker.details,
                    textAlign: TextAlign.justify,
                    style: Styles.bottomSheetDescriptionText
                        .copyWith(fontSize: 14.0),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDetails(context);
      },
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SpeakerBoxImage(
              image: speaker.image,
              size: 50.0,
            ),
            SizedBox(width: 15.0),
            Flexible(
              child: Text(
                speaker.name,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  letterSpacing: -1.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
