import 'package:congresso_unama/app/pages/location/location_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:congresso_unama/app/pages/location/location_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModule extends ModuleWidget {
  final String address;
  final LatLng latLng;

  LocationModule({this.address, this.latLng});

  @override
  List<Bloc> get blocs => [
        Bloc((i) => LocationBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => LocationPage(address: address, latLng: latLng);

  static Inject get to => Inject<LocationModule>.of();
}
