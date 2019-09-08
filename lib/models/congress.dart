import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Congress extends Equatable {
  final String id;
  final String name;
  final String shortName;
  final String shortestName;
  final String description;
  final String image;
  final Color color;

  Congress({
    this.id,
    this.name,
    this.shortName,
    this.shortestName,
    this.description,
    this.image,
    this.color,
  }) : super([id, name, shortName, shortestName, description, image, color]);

  factory Congress.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Congress(
      id: doc.documentID,
      name: data['name'],
      shortName: data['short_name'],
      shortestName: data['shortest_name'],
      description: data['description'],
      image: data['image'],
      color: Color(int.parse(data['color'].replaceAll('#', ''), radix: 16))
          .withOpacity(1.0),
    );
  }
}
