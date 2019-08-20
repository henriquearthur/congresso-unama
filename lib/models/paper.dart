import 'package:cloud_firestore/cloud_firestore.dart';

class Paper {
  final String id;
  final String title;
  final String type;
  final List<String> students;
  final String presentationMethod;
  final String location;
  final String hourStart;
  final String hourEnd;
  final String congress;
  final String date;

  Paper(
      {this.id,
      this.title,
      this.type,
      this.students,
      this.presentationMethod,
      this.location,
      this.hourStart,
      this.hourEnd,
      this.congress,
      this.date});

  factory Paper.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Paper(
      id: doc.documentID,
      title: data['title'] ?? '',
      type: data['type'] ?? '',
      students: (data['names'].cast<String>() ?? [])..sort(),
      presentationMethod: data['presentation_method'] ?? '',
      location: data['location'] ?? '',
      hourStart: data['hour_start'] ?? '',
      hourEnd: data['hour_end'] ?? '',
      date: data['date'] ?? '',
      congress: data['congress'] ?? '',
    );
  }
}
