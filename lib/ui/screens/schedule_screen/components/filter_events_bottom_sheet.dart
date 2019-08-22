import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_event_chip.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class FilterEventsBottomSheet extends StatelessWidget {
  final congressesIds = ["arquitetura", "computacao", "engenharia"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
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
            direction: Axis.vertical,
            children: <Widget>[
              for (var congressId in congressesIds)
                FilterEventChip(congressId: congressId),
            ],
          )
        ],
      ),
    );
  }
}
