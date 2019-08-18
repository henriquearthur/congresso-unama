import 'package:congresso_unama/blocs/congress/bloc.dart';
import 'package:congresso_unama/blocs/speaker/bloc.dart';
import 'package:congresso_unama/blocs/speaker/speaker_bloc.dart';
import 'package:congresso_unama/repositories/congress_repository.dart';
import 'package:congresso_unama/repositories/speaker_repository.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_data_loading.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_info_title.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speakers_list.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:congresso_unama/ui/utils/get_event_color.dart';
import 'package:congresso_unama/ui/utils/get_event_short_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewEventDefaultScreen extends StatefulWidget {
  final String congress;

  const ViewEventDefaultScreen({Key key, this.congress}) : super(key: key);

  @override
  _ViewEventDefaultScreenState createState() => _ViewEventDefaultScreenState();
}

class _ViewEventDefaultScreenState extends State<ViewEventDefaultScreen> {
  CongressRepository congressRepository;
  CongressBloc congressBloc;

  @override
  void initState() {
    super.initState();

    congressRepository = CongressRepository();
    congressBloc = CongressBloc(congressRepository: congressRepository);

    congressBloc.dispatch(LoadCongress(widget.congress));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getEventColor(widget.congress),
        title: Text(
          getEventShortName(widget.congress),
          style: Styles.appBarPageTitleText.apply(color: Colors.white),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      // TODO: Replace ListView with slivers
      body: ListView(children: <Widget>[
        AspectRatio(
          aspectRatio: 20 / 9,
          child: Hero(
            tag: widget.congress,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      AssetImage("assets/images/banner_${widget.congress}.jpg"),
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<CongressBloc, CongressState>(
          bloc: congressBloc,
          builder: (context, state) {
            if (state is InitialCongressState) {
              return EventDataLoading(color: getEventColor(widget.congress));
            } else if (state is LoadingCongressState) {
              return EventDataLoading(color: getEventColor(widget.congress));
            } else if (state is LoadedCongressState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    EventInfoTitle(title: "Sobre o evento"),
                    // TODO: Improve text structure
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
                        SpeakerBloc bloc = SpeakerBloc(
                          speakerRepository: SpeakerRepository(),
                        );

                        bloc.dispatch(LoadSpeakers(state.congress));

                        return bloc;
                      },
                      child: SpeakersList(),
                    ),
                  ],
                ),
              );
            }

            return EventDataLoading(color: getEventColor(widget.congress));
          },
        )
      ]),
    );
  }
}
