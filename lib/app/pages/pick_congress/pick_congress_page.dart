import 'package:congresso_unama/app/pages/pick_congress/components/congress_box.dart';
import 'package:congresso_unama/app/pages/pick_congress/pick_congress_bloc.dart';
import 'package:congresso_unama/app/pages/pick_congress/pick_congress_module.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:flutter/material.dart';

import 'components/pick_congress_header.dart';

class PickCongressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const PickCongressHeader(),
            StreamBuilder(
              stream: PickCongressModule.to
                  .bloc<PickCongressBloc>()
                  .congressListOut,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Congress>> snapshot) {
                if (snapshot.hasData) {
                  var congresses = snapshot.data;

                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16.0),
                    itemCount: congresses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CongressBox(
                        congress: congresses[index],
                        onTap: () {},
                      );
                    },
                  );
                }

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
