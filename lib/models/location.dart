import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final String name;
  final String address;
  final String district;
  final double lat;
  final double lng;

  Location({this.name, this.address, this.district, this.lat, this.lng});

  factory Location.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Location(
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      district: data['district'] ?? '',
      lat: data['lat'] ?? 0.0,
      lng: data['lng'] ?? 0.0,
    );
  }
}
