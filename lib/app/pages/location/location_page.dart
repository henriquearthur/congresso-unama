import 'dart:async';

import 'package:congresso_unama/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  final String address;
  final LatLng latLng;

  const LocationPage({Key key, this.address, this.latLng}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();
  bool _showGoogleMaps = false;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // https://github.com/flutter/flutter/issues/28493
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showGoogleMaps = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_showGoogleMaps) {
      body = Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              markers: {
                Marker(
                  markerId: MarkerId(widget.address),
                  position: widget.latLng,
                  infoWindow: InfoWindow(title: widget.address),
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
              initialCameraPosition: CameraPosition(
                target: widget.latLng,
                zoom: 15.0,
              ),
            ),
          ],
        ),
      );
    } else {
      body = Container(
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
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
      body: body,
    );
  }
}
