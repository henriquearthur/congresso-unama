import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  String admobAppId = 'ca-app-pub-6254443832700241~1019293817';
  Admob.initialize(admobAppId);

  Crashlytics.instance.enableInDevMode = false;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(AppModule());
}
