import 'package:congresso_unama/app/pages/explore/components/curve_painter.dart';
import 'package:flutter/material.dart';

class PickCongressHeader extends StatelessWidget {
  const PickCongressHeader();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 260.0,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 56.0,
                ),
                SizedBox(height: 5),
                Text(
                  "Escolha um congresso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.0,
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
      painter: CurvePainter(),
    );
  }
}
