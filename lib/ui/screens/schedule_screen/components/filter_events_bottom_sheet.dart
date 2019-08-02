import 'package:congresso_unama/providers/event_filter.dart';
import 'package:congresso_unama/ui/screens/schedule_screen/components/filter_event_chip.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterEventsBottomSheet extends StatelessWidget {
  final events = ["arquitetura", "computacao", "engenharia"];

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Filtrar por área",
                  style: Styles.bottomSheetTitleText,
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
                for (var event in events) FilterEventChip(event: event),
              ],
            )
          ],
        ),
      ),
    );
  }
}
