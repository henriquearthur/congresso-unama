import 'dart:async';

import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
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
            height: 300.0,
            child: Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: {
                    Marker(
                      markerId: MarkerId(state.location.name),
                      position: LatLng(state.location.lat, state.location.lng),
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
    );
  }
}
