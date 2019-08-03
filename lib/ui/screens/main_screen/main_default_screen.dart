import 'package:congresso_unama/ui/screens/main_screen/components/event_banner.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';

class MainDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text(
              "Explorar",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 32.0,
                letterSpacing: -1.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "O 4º Congresso Nacional de Ciências Exatas e Tecnologias oferece programação para as áreas de Arquitetura e Urbanismo, Informática e Engenharia.\n\nToque em um evento para explorar mais informações.",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20.0),
            EventBanner(
              image: AssetImage('assets/images/banner_arquitetura.jpg'),
              heroTag: "arquitetura",
              onTap: () {
                Navigator.of(context).pushNamed("/view-event",
                    arguments: {'event': 'arquitetura'});
              },
            ),
            SizedBox(height: 20.0),
            EventBanner(
              image: AssetImage('assets/images/banner_computacao.jpg'),
              heroTag: "computacao",
              onTap: () {
                Navigator.of(context).pushNamed("/view-event",
                    arguments: {'event': 'computacao'});
              },
            ),
            SizedBox(height: 20.0),
            EventBanner(
              image: AssetImage('assets/images/banner_engenharia.jpg'),
              heroTag: "engenharia",
              onTap: () {
                Navigator.of(context).pushNamed("/view-event",
                    arguments: {'event': 'engenharia'});
              },
            ),
          ],
        ),
      ),
    );
  }

  SafeArea oldTree() {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "Explorar",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 42.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'congressoArquitetura',
                        child: Image.asset(
                          "assets/images/banner_arquitetura.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'congressoEngenharia',
                        child: Image.asset(
                          "assets/images/banner_engenharia.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'congressoComputacao',
                        child: Image.asset(
                          "assets/images/banner_computacao.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
