import 'package:congresso_unama/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IV Congresso Nacional de Ciências Exatas e Tecnologia',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: App(),
    );
  }
}
