import 'package:congresso_unama/models/speaker.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speaker_image.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class SpeakerItem extends StatelessWidget {
  final Speaker speaker;

  const SpeakerItem({Key key, this.speaker}) : super(key: key);

  void _showDetails(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // TODO: UI - Change this to scrollable bottom sheet
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SpeakerImage(
                  image: speaker.image,
                  size: 120.0,
                ),
                SizedBox(height: 15.0),
                Text(
                  speaker.name,
                  style: Styles.bottomSheetTitleText,
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
          ),
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
            SpeakerImage(
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
