import 'dart:async';

import 'package:congresso_unama/blocs/information/bloc.dart';
import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future _openMapsApp(double lat, double lng) async {
    String mapSchema = 'geo:$lat,$lng';

    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      builder: (context, state) {
        if (state is InitialInformationState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadingInformationState) {
          return Center(child: CircularProgressIndicator());
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () =>
                          _openMapsApp(state.location.lat, state.location.lng),
                      backgroundColor: Styles.primaryColor,
                      child: const Icon(Icons.map, size: 32.0),
                    ),
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
