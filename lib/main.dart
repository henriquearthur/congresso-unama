import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/app_module.dart';

void main() {
  String admobAppId = 'ca-app-pub-6254443832700241~1019293817';
  Admob.initialize(admobAppId);

  runApp(AppModule());
}
