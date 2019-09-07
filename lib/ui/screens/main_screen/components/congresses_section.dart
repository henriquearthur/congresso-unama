import 'package:congresso_unama/ui/screens/main_screen/components/congress_banner.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class CongressesSection extends StatelessWidget {
  void _openCongress(BuildContext context, String congress) {
    Navigator.of(context).pushNamed("/view-event", arguments: {
      'event': congress,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Explore os congressos",
          style: Styles.mainScreenTitleText,
        ),
        Text(
          "Toque em um congresso para saber mais sobre os temas abordados e os conferencistas participantes.",
          style: Styles.mainScreenDescriptionText,
        ),
        SizedBox(height: 20.0),
        CongressBanner(
          image: AssetImage('assets/images/banner_arquitetura.jpg'),
          onTap: () => _openCongress(context, "arquitetura"),
        ),
        SizedBox(height: 20.0),
        CongressBanner(
          image: AssetImage('assets/images/banner_computacao.jpg'),
          onTap: () => _openCongress(context, "computacao"),
        ),
        SizedBox(height: 20.0),
        CongressBanner(
          image: AssetImage('assets/images/banner_engenharia.jpg'),
          onTap: () => _openCongress(context, "engenharia"),
        ),
      ],
    );
  }
}
