import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'filter_lecture_chip.dart';

class FilterLecturesBottomSheet extends StatelessWidget {
  final List<String> tags;

  const FilterLecturesBottomSheet({Key key, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Filtrar por área",
                style: Styles.bottomSheetTitleText,
              ),
              Icon(
                Icons.filter_list,
                color: Styles.bottomSheetTitleColor,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            "Toque em uma ou mais áreas para visualizar apenas as palestras que lhe interessam.",
            style: Styles.bottomSheetDescriptionText,
          ),
          SizedBox(height: 20.0),
          Wrap(
            spacing: 10.0,
            children: <Widget>[
              for (var tag in tags) FilterLectureChip(tag: tag),
            ],
          )
        ],
      ),
    );
  }
}
