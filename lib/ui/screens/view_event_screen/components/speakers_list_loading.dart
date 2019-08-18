import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class SpeakersListLoading extends StatelessWidget {
  const SpeakersListLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.primaryColor),
        ),
      ),
    );
  }
}
