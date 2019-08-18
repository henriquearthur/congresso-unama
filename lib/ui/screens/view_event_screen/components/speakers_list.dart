import 'package:congresso_unama/blocs/speaker/bloc.dart';
import 'package:congresso_unama/models/speaker.dart';
import 'package:congresso_unama/repositories/speaker_repository.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/event_info_title.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speaker_item.dart';
import 'package:congresso_unama/ui/screens/view_event_screen/components/speakers_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersList extends StatelessWidget {
  final SpeakerBloc speakerBloc =
      SpeakerBloc(speakerRepository: SpeakerRepository());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25.0),
        BlocBuilder<SpeakerBloc, SpeakerState>(
          builder: (context, state) {
            if (state is InitialSpeakerState) {
              return SpeakersListLoading();
            } else if (state is LoadingSpeakersState) {
              return SpeakersListLoading();
            } else if (state is LoadedSpeakersState) {
              if (state.speakers.length > 0) {
                return Column(
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    EventInfoTitle(title: "Palestrantes"),
                    for (Speaker speaker in state.speakers) ...[
                      SpeakerItem(speaker: speaker),
                      SizedBox(height: 15.0),
                    ]
                  ],
                );
              } else {
                return Text("Nenhum palestrante neste congresso.");
              }
            }

            return SpeakersListLoading();
          },
        )
      ],
    );
  }
}
