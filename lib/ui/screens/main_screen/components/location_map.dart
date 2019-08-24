import 'dart:async';

import 'package:congresso_unama/ui/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const double _hangarLat = -1.421643;
  static const double _hangarLng = -48.456782;
  static const LatLng _hangarLatLng = LatLng(_hangarLat, _hangarLng);

  final Set<Marker> _markers = {
    Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId("Hangar"),
      position: _hangarLatLng,
      infoWindow: InfoWindow(title: 'Hangar Convenções & Feiras da Amazônia'),
      icon: BitmapDescriptor.defaultMarker,
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future _openGoogleMaps() async {
    var mapSchema = 'geo:$_hangarLat,$_hangarLng';

    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _hangarLatLng,
              zoom: 15.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _openGoogleMaps,
                backgroundColor: Styles.primaryColor,
                child: const Icon(Icons.map, size: 32.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
