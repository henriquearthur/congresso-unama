import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'congress_banner.dart';

class CongressesSection extends StatelessWidget {
  void _openCongress(BuildContext context, Congress congress) {
    Navigator.of(context).pushNamed("/view-event", arguments: {
      'congress': congress,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        // BlocBuilder<CongressBloc, CongressState>(
        //   builder: (context, state) {
        //     if (state is LoadedCongressListState) {
        //       return Column(
        //         children: <Widget>[
        //           for (var congress in state.congresses) ...[
        //             CongressBanner(
        //               imageUrl: congress.image,
        //               color: congress.color,
        //               onTap: () => _openCongress(context, congress),
        //             ),
        //             SizedBox(height: 20.0),
        //           ],
        //         ],
        //       );
        //     }

        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),
      ],
    );
  }
}
