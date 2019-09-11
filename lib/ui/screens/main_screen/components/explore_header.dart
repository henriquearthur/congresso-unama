import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/author_info_button.dart';
import 'package:congresso_unama/ui/screens/main_screen/components/curve_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreHeader extends StatelessWidget {
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
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1.0,
                  ),
                ),
                SizedBox(height: 15.0),
                BlocBuilder<InformationBloc, InformationState>(
                  builder: (context, state) {
                    if (state is LoadedInformationState) {
                      return Text(
                        "Confira a programação do ${state.information.eventName}.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: -0.5,
                        ),
                      );
                    }

                    return Text(
                      "Carregando",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: -0.5,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      painter: CurvePainter(),
    );
  }
}
