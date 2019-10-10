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
        height: 330.0,
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
                        size: 42.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Olá, congressista!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
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
                      return Column(
                        children: <Widget>[
                          Text(
                            snapshot.data.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: Styles.primaryFontSemiboldWeight,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RaisedButton(
                            onPressed: () {
                              _congressBloc.mustSelectCongressIn.add(true);
                            },
                            color: Colors.black.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                            ),
                            elevation: 0,
                            child: Text(
                              "Mudar congresso",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
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
