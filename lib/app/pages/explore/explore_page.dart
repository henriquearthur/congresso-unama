import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/pages/explore/components/section_title.dart';
import 'package:congresso_unama/app/pages/explore/components/speaker_box.dart';
import 'package:congresso_unama/app/pages/explore/explore_bloc.dart';
import 'package:congresso_unama/app/pages/explore/explore_module.dart';
import 'package:congresso_unama/app/pages/location/location_module.dart';
import 'package:congresso_unama/app/shared/blocs/congress_bloc.dart';
import 'package:congresso_unama/app/shared/components/scroll_no_glow_behavior.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/speaker.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/explore_header.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final CongressBloc _congressBloc = AppModule.to.getBloc<CongressBloc>();
  final ExploreBloc _exploreBloc = ExploreModule.to.getBloc<ExploreBloc>();
  StreamSubscription _congressSubscription;

  @override
  void initState() {
    _congressSubscription =
        _congressBloc.congressOut.listen(_exploreBloc.getSpeakersList);
    super.initState();
  }

  @override
  void dispose() {
    _congressSubscription.cancel();
    super.dispose();
  }

  void _openLocationScreen(String address, LatLng latLng) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LocationModule(
          address: address,
          latLng: latLng,
        ),
      ),
    );
  }

  Future __openRegistrationSite(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  StreamBuilder(
                    stream: _congressBloc.congressOut,
                    builder: (BuildContext context,
                        AsyncSnapshot<Congress> snapshot) {
                      if (snapshot.hasData) {
                        var congress = snapshot.data;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: Image(
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                image:
                                    CachedNetworkImageProvider(congress.image),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const SectionTitle(
                              title: 'Inscrições',
                              description:
                                  'Datas e valores para se inscrever no congresso',
                            ),
                            for (var registration in congress.registrations)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    registration.type,
                                    style: TextStyle(
                                      fontWeight:
                                          Styles.primaryFontSemiboldWeight,
                                    ),
                                  ),
                                  Text(registration.date),
                                  Text(
                                    registration.value,
                                    style: TextStyle(
                                      fontWeight:
                                          Styles.primaryFontSemiboldWeight,
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 8),
                            Center(
                              child: RaisedButton(
                                onPressed: () =>
                                    __openRegistrationSite(congress.link),
                                color: Styles.primaryColor,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Text(
                                  "Fazer inscrição no site",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const SectionTitle(
                              title: 'Conheça o congresso',
                              description: 'Informações gerais sobre o evento',
                            ),
                            Text(congress.description),
                            const SizedBox(height: 16),
                            const SectionTitle(
                              title: 'Localização',
                              description: 'Endereço e localização do evento',
                            ),
                            Text(congress.address),
                            Center(
                              child: RaisedButton(
                                onPressed: () => _openLocationScreen(
                                    congress.address, congress.latLng),
                                color: Styles.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                ),
                                child: Text(
                                  "Ver no mapa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder(
                              stream: _exploreBloc.speakersListOut,
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Speaker>> snapshot) {
                                if (snapshot.hasData) {
                                  var speakers = snapshot.data;

                                  if (speakers.length > 0) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const SizedBox(height: 16),
                                        const SectionTitle(
                                          title: 'Palestrantes',
                                          description:
                                              'Conheça as pessoas que estarão no congresso',
                                        ),
                                        for (var speaker in speakers) ...[
                                          SpeakerBox(speaker: speaker),
                                          const SizedBox(height: 16),
                                        ]
                                      ],
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                }

                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ],
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
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
