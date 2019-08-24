import 'package:congresso_unama/blocs/congress/bloc.dart';
import 'package:congresso_unama/blocs/speaker/bloc.dart';
import 'package:congresso_unama/blocs/speaker/speaker_bloc.dart';
import 'package:congresso_unama/repositories/congress_repository.dart';
import 'package:congresso_unama/repositories/speaker_repository.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_data_loading.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_info_title.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speakers_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_congress_color.dart';
import 'package:congresso_unama/ui/utils/get_congress_short_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewEventDefaultScreen extends StatelessWidget {
  final String congress;

  const ViewEventDefaultScreen({Key key, this.congress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              floating: false,
              pinned: true,
              backgroundColor: getCongressColor(congress),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  getCongressShortName(congress),
                  style:
                      Styles.appBarPageTitleText.copyWith(color: Colors.white),
                ),
                background: Stack(
                  children: <Widget>[
                    Image(
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 180.0 + 24.0,
                      image: AssetImage("assets/images/banner_$congress.jpg"),
                    ),
                    Container(
                      height: 180.0 + 24.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            getCongressColor(congress).withOpacity(0.8),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context)
              .copyWith(accentColor: getCongressColor(congress)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    BlocProvider(
                      builder: (context) {
                        CongressBloc congressBloc = CongressBloc(
                          congressRepository: CongressRepository(),
                        );

                        congressBloc.dispatch(LoadCongress(congress));

                        return congressBloc;
                      },
                      child: BlocBuilder<CongressBloc, CongressState>(
                        builder: (context, state) {
                          if (state is InitialCongressState) {
                            return EventDataLoading(
                                color: getCongressColor(congress));
                          } else if (state is LoadingCongressState) {
                            return EventDataLoading(
                                color: getCongressColor(congress));
                          } else if (state is LoadedCongressState) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  EventInfoTitle(title: "Sobre o evento"),
                                  Text(
                                    state.congress.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  BlocProvider(
                                    builder: (context) {
                                      SpeakerBloc speakerBloc = SpeakerBloc(
                                        speakerRepository: SpeakerRepository(),
                                      );

                                      speakerBloc.dispatch(
                                          LoadSpeakers(state.congress));

                                      return speakerBloc;
                                    },
                                    child: SpeakersList(),
                                  ),
                                ],
                              ),
                            );
                          }

                          return EventDataLoading(
                              color: getCongressColor(congress));
                        },
                      ),
                    )
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
