import 'package:congresso_unama/app/app_module.dart';
import 'package:congresso_unama/app/shared/blocs/congress_bloc.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'author_info_button.dart';
import 'curve_painter.dart';

class ExploreHeader extends StatelessWidget {
  final CongressBloc _congressBloc = AppModule.to.bloc<CongressBloc>();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 320.0,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: AuthorInfoButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 64.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Olá, congressista!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: Styles.primaryFontMediumWeight,
                    letterSpacing: -1.0,
                  ),
                ),
                SizedBox(height: 15.0),
                StreamBuilder(
                  stream: _congressBloc.congressOut,
                  builder:
                      (BuildContext context, AsyncSnapshot<Congress> snapshot) {
                    if (snapshot.hasData) {
                      return RichText(
                        text: TextSpan(
                          text: 'Confira a programação do ',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: -0.5,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${snapshot.data.title}.',
                              style: TextStyle(
                                  fontWeight: Styles.primaryFontSemiboldWeight),
                            ),
                          ],
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor:
                            Styles.primaryColorDark.withOpacity(0.5),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Styles.primaryColor.withOpacity(0.5)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      painter: CurvePainter(),
    );
  }
}
