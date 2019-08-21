import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorInfoDialog extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(
            Icons.info_outline,
            color: Styles.dialogTitleColor,
          ),
          SizedBox(width: 15.0),
          Text(
            "Sobre o app",
            style: TextStyle(color: Styles.dialogTitleColor),
          ),
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Desenvolvido com Flutter",
                style: Styles.dialogContentText.apply(fontSizeFactor: 0.85),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: FlutterLogo(),
              ),
            ],
          )
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
