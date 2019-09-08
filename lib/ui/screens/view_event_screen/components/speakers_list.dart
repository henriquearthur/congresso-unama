import 'package:congresso_unama/blocs/speaker/bloc.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/models/speaker.dart';
import 'package:congresso_unama/repositories/speaker_repository.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_info_title.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speaker_item.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speakers_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersList extends StatelessWidget {
  final Congress congress;

  const SpeakersList({Key key, this.congress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        SpeakerBloc speakerBloc = SpeakerBloc(
          speakerRepository: SpeakerRepository(),
        );

        speakerBloc.dispatch(LoadSpeakers(congress));

        return speakerBloc;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          EventInfoTitle(title: "Palestrantes"),
          BlocBuilder<SpeakerBloc, SpeakerState>(
            builder: (context, state) {
              if (state is LoadedSpeakersState) {
                if (state.speakers.length > 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (Speaker speaker in state.speakers) ...[
                        SpeakerItem(speaker: speaker),
                        SizedBox(height: 15.0),
                      ]
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      "Nenhum palestrante neste congresso.",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                      ),
                    ),
                  );
                }
              }

              return SpeakersListLoading();
            },
          )
        ],
      ),
    );
  }
}
