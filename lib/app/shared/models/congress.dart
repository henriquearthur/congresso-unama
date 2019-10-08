import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Congress {
  final String id;
  final String title;
  final String description;
  final String image;
  final Color color;
  final String link;
  final DateTime dateStart;
  final DateTime dateEnd;

  Congress({
    this.id,
    this.title,
    this.description,
    this.image,
    this.color,
    this.link,
    this.dateStart,
    this.dateEnd,
  });

  String getFullDateStart() =>
      DateFormat("EEEE',' d 'de' MMMM", 'pt_BR').format(dateStart);
  String getFullDateEnd() =>
      DateFormat("EEEE',' d 'de' MMMM", 'pt_BR').format(dateEnd);

  factory Congress.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    DateTime dateStart;
    DateTime dateEnd;

    if (data['date_start'] != null) {
      List<String> dateStartArr = data['date_start'].split('-');
      int dateStartDay = int.parse(dateStartArr[0]);
      int dateStartMonth = int.parse(dateStartArr[1]);
      int dateStartYear = int.parse(dateStartArr[2]);

      dateStart = DateTime(dateStartYear, dateStartMonth, dateStartDay);
    }

    if (data['date_end'] != null) {
      List<String> dateEndArr = data['date_end'].split('-');
      int dateEndDay = int.parse(dateEndArr[0]);
      int dateEndMonth = int.parse(dateEndArr[1]);
      int dateEndYear = int.parse(dateEndArr[2]);

      dateEnd = DateTime(dateEndYear, dateEndMonth, dateEndDay);
    }

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
      dateStart: dateStart ?? null,
      dateEnd: dateEnd ?? null,
    );
  }
}
