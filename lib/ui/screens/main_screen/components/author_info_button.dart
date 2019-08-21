import 'package:congresso_unama/ui/screens/main_screen/components/author_info_dialog.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class AuthorInfoButton extends StatelessWidget {
  void _showAuthorInfoDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AuthorInfoDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent, // button color
        child: InkWell(
          splashColor:
              Styles.primaryColorDark.withOpacity(0.3), // inkwell color
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
          onTap: () => _showAuthorInfoDialog(context),
        ),
      ),
    );
  }
}
