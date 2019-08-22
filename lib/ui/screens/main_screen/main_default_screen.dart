import 'package:congresso_unama/ui/helpers/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/author_info_button.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/congress_banner.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/curve_painter.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class MainDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollNoGlowBehavior(),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            CustomPaint(
              child: Container(
                height: 380.0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: AuthorInfoButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.school,
                                color: Colors.white,
                                size: 64.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Olá, congressista!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -1.0,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "Consulte a programação dos congressos de Arquitetura e Urbanismo, Informática e/ou Engenharia.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              painter: CurvePainter(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Explore os congressos",
                    style: TextStyle(
                      color: Styles.primaryColorDark,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -2.0,
                    ),
                  ),
                  Text(
                    "Toque em um congresso para saber mais sobre os temas abordados e os conferencistas participantes.",
                    style: TextStyle(
                      color: Styles.primaryColorDark,
                      fontSize: 16.0,
                    ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
