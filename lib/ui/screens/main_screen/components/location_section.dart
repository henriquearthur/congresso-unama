import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSection extends StatelessWidget {
  void _openLocationScreen(BuildContext context) {
    Navigator.of(context).pushNamed("/view-location");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Localização",
          style: Styles.mainScreenTitleText,
        ),
        Text(
          "Endereço e localização do evento",
          style: Styles.mainScreenDescriptionText,
        ),
        SizedBox(height: 20.0),
        BlocBuilder<InformationBloc, InformationState>(
          builder: (context, state) {
            if (state is InitialInformationState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadingInformationState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedInformationState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: state.information.locationName + "\n",
                      style: DefaultTextStyle.of(context).style.copyWith(
                            color: Styles.primaryColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                            text: state.information.locationAddress + "\n",
                            style: TextStyle(fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: state.information.locationDistrict,
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: RaisedButton(
                      color: Styles.primaryColor,
                      onPressed: () => _openLocationScreen(context),
                      child: Text(
                        "Ver no mapa",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: -0.5,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }

            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
