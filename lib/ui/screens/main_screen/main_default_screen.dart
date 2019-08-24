import 'package:congresso_unama/ui/helpers/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/congress_banner.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/explore_header.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/location_map.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class MainDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Styles.primaryColor,
          elevation: 0.0,
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollNoGlowBehavior(),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            ExploreHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () {
                      Navigator.of(context).pushNamed("/view-event",
                          arguments: {'event': 'arquitetura'});
                    },
                  ),
                  SizedBox(height: 20.0),
                  CongressBanner(
                    image: AssetImage('assets/images/banner_computacao.jpg'),
                    onTap: () {
                      Navigator.of(context).pushNamed("/view-event",
                          arguments: {'event': 'computacao'});
                    },
                  ),
                  SizedBox(height: 20.0),
                  CongressBanner(
                    image: AssetImage('assets/images/banner_engenharia.jpg'),
                    onTap: () {
                      Navigator.of(context).pushNamed("/view-event",
                          arguments: {'event': 'engenharia'});
                    },
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "Localização",
                    style: Styles.mainScreenTitleText,
                  ),
                  Text(
                    "Os congressos estão acontecendo no Hangar.",
                    style: Styles.mainScreenDescriptionText,
                  ),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      text: 'Hangar Convenções & Feiras da Amazônia\n',
                      style: DefaultTextStyle.of(context).style.copyWith(
                            color: Styles.primaryColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Av. Doutor Freitas, s/n\n',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: 'CEP 66613-902 - Marco – Belém – Pará\n',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LocationMap(),
          ],
        ),
      ),
    );
  }
}
