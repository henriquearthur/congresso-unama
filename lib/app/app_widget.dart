import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/home/home_module.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Congressos UNAMA',
      theme: ThemeData(
        primarySwatch: Styles.primaryColor,
        primaryColor: Styles.primaryColor,
        primaryColorDark: Styles.primaryColorDark,
        fontFamily: Styles.primaryFontFamily,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // English
      ],
      locale: Locale('pt', 'BR'),
      home: HomeModule(),
    );
  }
}
