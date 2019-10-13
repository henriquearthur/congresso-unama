import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String description;

  const SectionTitle({Key key, @required this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Styles.mainScreenTitleText,
          ),
          if (description != null)
            Text(
              description,
              style: Styles.mainScreenDescriptionText,
            )
        ],
      ),
    );
  }
}
