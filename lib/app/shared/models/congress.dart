import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Congress {
  final String id;
  final String title;
  final String description;
  final String image;
  final Color color;
  final String link;

  Congress({
    this.id,
    this.title,
    this.description,
    this.image,
    this.color,
    this.link,
  });

  factory Congress.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Congress(
      id: doc.documentID,
      title: data['title'],
      description: data['description'],
      image: data['image'],
      color: data['color'] is String
          ? Color(int.parse(data['color'].replaceAll('#', ''), radix: 16))
              .withOpacity(1.0)
          : Colors.grey,
      link: data['link'],
    );
  }
}
