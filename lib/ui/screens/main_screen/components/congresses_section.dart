import 'package:congresso_unama/blocs/congress/bloc.dart';
import 'package:congresso_unama/repositories/congress_repository.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/congress_banner.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CongressesSection extends StatelessWidget {
  void _openCongress(BuildContext context, String congress) {
    Navigator.of(context).pushNamed("/view-event", arguments: {
      'event': congress,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        CongressBloc congressBloc = CongressBloc(
          congressRepository: CongressRepository(),
        );

        congressBloc.dispatch(LoadCongressList());

        return congressBloc;
      },
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
          BlocBuilder<CongressBloc, CongressState>(
            builder: (context, state) {
              if (state is LoadedCongressListState) {
                return Column(
                  children: <Widget>[
                    for (var congress in state.congresses) ...[
                      CongressBanner(
                        image: NetworkImage(congress.image),
                        onTap: () => _openCongress(context, "arquitetura"),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
