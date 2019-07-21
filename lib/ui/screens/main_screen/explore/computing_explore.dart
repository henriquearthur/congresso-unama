import 'package:congresso_unama/ui/screens/main_screen/explore/speaker_item.dart';
import 'package:flutter/material.dart';

class ComputingExplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.9],
          colors: [
            Colors.grey[50],
            Colors.grey[100],
            Colors.grey[200],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'congressoComputacao',
                child: Image.asset(
                  "assets/images/banner_computacao.jpg",
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: <Widget>[
                    Text(
                      "Belém irá sediar o 3º Congresso Nacional das Engenharias, que acontecerá nos dias 25, 26 e 27 de outubro, no Hangar - Centro de Convenções e Feiras da Amazônia. “Amazônia Globalizada e o Futuro das Cidades” é o tema principal do evento que é uma realização da Universidade da Amazônia - UNAMA e conta com o apoio da UNINASSAU, da Univeritas, UnG, e Faculdade Joaquim Nabuco. O Congresso irá abordar sobre as novas tecnologias aplicadas na Engenharia Civil, Engenharia Ambiental e Sanitária, Engenharia de Produção, Engenharia Mecânica e Engenharia Elétrica. Contará com a presença de ilustres e renomados palestrantes nacionais, minicursos e submissão de trabalhos científicos apresentados em e-posters.",
                      style: TextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        "Palestrantes",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: "Lato",
                          fontSize: 32.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SpeakerItem(),
                    SpeakerItem(),
                    SpeakerItem(),
                    SpeakerItem(),
                    SpeakerItem(),
                    SpeakerItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
