import 'package:congresso_unama/app/shared/components/header_curve_painter.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

class PickCongressHeader extends StatelessWidget {
  const PickCongressHeader();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ExploreHeaderCurve(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220.0,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 42.0,
                ),
                SizedBox(height: 5),
                Text(
                  "Escolha um congresso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: Styles.primaryFontMediumWeight,
                    letterSpacing: -1.0,
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
