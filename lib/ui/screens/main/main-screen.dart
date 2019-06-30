import 'package:congresso_unama/ui/screens/explore/architecture-screen.dart';
import 'package:congresso_unama/ui/screens/explore/computing-screen.dart';
import 'package:congresso_unama/ui/screens/explore/engineering-screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Explorar",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: "Lato",
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return ArchitectureScreen();
                        }));
                      },
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return EngineeringScreen();
                        }));
                      },
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return ComputingScreen();
                        }));
                      },
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

class ScrollWithoutGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
