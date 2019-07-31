import 'package:flutter/material.dart';

class MainDefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
