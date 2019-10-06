import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorInfoDialog extends StatefulWidget {
  @override
  _AuthorInfoDialogState createState() => _AuthorInfoDialogState();
}

class _AuthorInfoDialogState extends State<AuthorInfoDialog> {
  Future<String> _appVersion;

  _launchMailTo() async {
    const url =
        'mailto:eu@henriquearthur.com.br?subject=Aplicativo%20Congresso%20Unama';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _closeDialog(context) {
    Navigator.of(context).pop();
  }

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  void initState() {
    super.initState();

    _appVersion = _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      title: Column(
        children: <Widget>[
          Icon(
            Icons.school,
            color: Styles.primaryColor,
            size: 56.0,
          ),
          Text(
            "Congressos Unama",
            style: TextStyle(color: Styles.primaryColor),
          ),
          FutureBuilder(
            future: _appVersion,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "Versão ${snapshot.data}",
                  style: Styles.dialogContentText,
                );
              } else {
                return Text(
                  "Versão -",
                  style: Styles.dialogContentText,
                );
              }
            },
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: 'Este app foi desenvolvido pelo aluno ',
              style: Styles.dialogContentText,
              children: <TextSpan>[
                TextSpan(
                    text: 'Henrique Arthur',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                TextSpan(text: ', graduando do curso de '),
                TextSpan(
                    text: 'Ciência da Computação ',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                TextSpan(text: 'na '),
                TextSpan(
                    text: 'Universidade da Amazônia (UNAMA).',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Entrar em contato"),
          onPressed: _launchMailTo,
        ),
        FlatButton(
          child: Text("Fechar"),
          onPressed: () => _closeDialog(context),
        ),
      ],
    );
  }
}
