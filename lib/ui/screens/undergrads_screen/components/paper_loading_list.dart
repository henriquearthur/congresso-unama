import 'package:flutter/material.dart';

class PaperLoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 32.0),
      child: CircularProgressIndicator(),
    );
  }
}