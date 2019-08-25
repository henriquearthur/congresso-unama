import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/helpers/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/congress_banner.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/explore_header.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDefaultScreen extends StatelessWidget {
  void _openCongress(BuildContext context, String congress) {
    Navigator.of(context).pushNamed("/view-event", arguments: {
      'event': congress,
    });
  }

  void _openLocationScreen(BuildContext context) {
    Navigator.of(context).pushNamed("/view-location");
  }

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
                  SizedBox(height: 40.0),
                  Text(
                    "Localização",
                    style: Styles.mainScreenTitleText,
                  ),
                  Text(
                    "Endereço e localização do evento",
                    style: Styles.mainScreenDescriptionText,
                  ),
                  SizedBox(height: 20.0),
                  BlocBuilder<InformationBloc, InformationState>(
                    builder: (context, state) {
                      if (state is InitialInformationState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is LoadingInformationState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is LoadedInformationState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: state.location.name + "\n",
                                style:
                                    DefaultTextStyle.of(context).style.copyWith(
                                          color: Styles.primaryColorDark,
                                          fontWeight: FontWeight.w600,
                                        ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: state.location.address + "\n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                  TextSpan(
                                      text: state.location.district,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: RaisedButton(
                                color: Styles.primaryColor,
                                onPressed: () => _openLocationScreen(context),
                                child: Text(
                                  "Ver no mapa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: -0.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }

                      return CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
