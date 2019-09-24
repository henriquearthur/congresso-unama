import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/congress.dart';

class Paper {
  final String id;
  final String title;
  final String type;
  final List<String> students;
  final String presentationMethod;
  final String location;
  final String hour;
  final String hourStart;
  final String hourEnd;
  final String congressId;
  final String date;
  Congress congress;

  Paper(
      {this.id,
      this.title,
      this.type,
      this.students,
      this.presentationMethod,
      this.location,
      this.hour,
      this.hourStart,
      this.hourEnd,
      this.congressId,
      this.date,
      this.congress});

  factory Paper.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Paper(
      id: doc.documentID,
      title: data['title'] ?? '',
      type: data['type'] ?? '',
      students: (data['names'].cast<String>() ?? [])..sort(),
      presentationMethod: data['presentation_method'] ?? '',
      location: data['location'] ?? '',
      hour: data['hour'] ?? '',
      hourStart: data['hour_start'] ?? '',
      hourEnd: data['hour_end'] ?? '',
      date: data['date'] ?? '',
      congressId: data['congress'] ?? '',
    );
  }
}
