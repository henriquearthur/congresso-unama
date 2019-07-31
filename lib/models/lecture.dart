import 'package:cloud_firestore/cloud_firestore.dart';

class Lecture {
  final String id;
  final String title;
  final String type;
  final String speaker;
  final String speakerImg;
  final String hourStart;
  final String hourEnd;
  final String event;
  final String date;

  Lecture(
      {this.id,
      this.title,
      this.type,
      this.speaker,
      this.speakerImg,
      this.hourStart,
      this.hourEnd,
      this.event,
      this.date});

  factory Lecture.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Lecture(
      id: doc.documentID,
      title: data['title'] ?? '',
      type: data['type'] ?? '',
      speaker: data['speaker'] ?? '',
      speakerImg: data['speaker_img'] ?? '',
      hourStart: data['hour_start'] ?? '',
      hourEnd: data['hour_end'] ?? '',
      date: data['date'] ?? '',
      event: data['event'] ?? '',
    );
  }
}
