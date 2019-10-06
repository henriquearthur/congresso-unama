import 'package:congresso_unama/app/shared/components/helpers/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'components/congresses_section.dart';
import 'components/explore_header.dart';
import 'components/location_section.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
