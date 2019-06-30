import 'package:flutter/material.dart';

class SpeakerItem extends StatelessWidget {
  void _showDetails(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Edinaldo João Costa de La-Roque",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: "Lato",
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Text(
                  "Mestre em Ciência da Computação pela UFPA, linha de pesquisa Redes de Computadores, tendo como tema da dissertação Uma Nova Abordagem de Seleção de Célula e Handover para Redes LTE Heterogêneas: Critérios Adicionais Baseados em Estimativa de Capacidade e Velocidade de Usuário, com formação em Telecomunicações, Análise e Desenvolvimento de Sistemas, Gerência de Projetos e Gerência da Qualidade (parcial). Professor da UNAMA - Universidade. Experiência em coordenar equipes de infraestrutura de redes e desenvolvimento de software. Forte perfil integrador de sistemas, multidisciplinar, para ambiente de pesquisa, desenvolvimento, documentação, consultoria e transferência de conhecimento (docência, palestras e seminários)."),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _showDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Edinaldo La-Roque",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                child: Image.network(
                  "https://eventos.sereduc.com/_image.aspx/CU01lPGvBVqP1bSYmyX2JnsJmCPGGXiTqDHy92sB8jk=/conferencista2049.jpg",
                  fit: BoxFit.cover,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
