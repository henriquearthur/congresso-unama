import 'dart:async';

import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDefaultScreen extends StatefulWidget {
  @override
  _LocationDefaultScreenState createState() => _LocationDefaultScreenState();
}

class _LocationDefaultScreenState extends State<LocationDefaultScreen> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: Text(
          'Localização',
          style: Styles.appBarTitleText,
        ),
        iconTheme: IconThemeData(color: Styles.appBarIconColor),
        centerTitle: true,
      ),
      body: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          if (state is InitialInformationState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is LoadingInformationState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is LoadedInformationState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: {
                      Marker(
                        markerId: MarkerId(state.location.name),
                        position:
                            LatLng(state.location.lat, state.location.lng),
                        infoWindow: InfoWindow(title: state.location.name),
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.location.lat, state.location.lng),
                      zoom: 15.0,
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
