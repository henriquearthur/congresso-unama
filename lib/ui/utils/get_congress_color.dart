import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

Color getCongressColor(event) {
  if (event == "arquitetura") {
    return Styles.architectureColor;
  } else if (event == "computacao") {
    return Styles.computingColor;
  } else if (event == "engenharia") {
    return Styles.engineeringColor;
  }

  return Colors.grey;
}
