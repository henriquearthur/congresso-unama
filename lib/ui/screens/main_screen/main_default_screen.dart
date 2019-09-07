import 'package:congresso_unama/ui/helpers/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/congresses_section.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/explore_header.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/location_section.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class MainDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Styles.primaryColor,
          elevation: 0.0,
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollNoGlowBehavior(),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            ExploreHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CongressesSection(),
                  SizedBox(height: 40.0),
                  LocationSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
