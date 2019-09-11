import 'package:congresso_unama/ui/app.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Congressos Unama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Styles.primaryColor,
        primaryColor: Styles.primaryColor,
        primaryColorDark: Styles.primaryColorDark,
        fontFamily: Styles.primaryFontFamily,
      ),
      home: App(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // English
      ],
      locale: Locale('pt', 'BR'),
    );
  }
}
