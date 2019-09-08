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
          if (state is LoadedInformationState && _showGoogleMaps) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: {
                      Marker(
                        markerId: MarkerId(state.information.locationName),
                        position: LatLng(state.information.locationLat,
                            state.information.locationLng),
                        infoWindow:
                            InfoWindow(title: state.information.locationName),
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(state.information.locationLat,
                          state.information.locationLng),
                      zoom: 15.0,
                    ),
                  ),
                ],
              ),
            );
          }

          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
