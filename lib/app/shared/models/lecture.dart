import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'congress.dart';

class Lecture {
  final String id;
  final String title;
  final String type;
  final String local;
  final String speaker;
  final String speakerImg;
  final String speakerDetails;
  final String hourStart;
  final String hourEnd;
  final String congressId;
  final String date;
  Congress congress;

  Lecture(
      {this.id,
      this.title,
      this.type,
      this.local,
      this.speaker,
      this.speakerImg,
      this.speakerDetails,
      this.hourStart,
      this.hourEnd,
      this.congressId,
      this.date,
      this.congress});

  String getFullDate() {
    List<String> arr = date.split('-');
    int day = int.parse(arr[0]);
    int month = int.parse(arr[1]);
    int year = int.parse(arr[2]);

    return DateFormat("EEEE',' d 'de' MMMM", 'pt_BR')
        .format(DateTime(year, month, day));
  }

  factory Lecture.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Lecture(
      id: doc.documentID,
      title: data['title'] ?? '',
      type: data['type'] ?? '',
      local: data['local'] ?? '',
      speaker: data['speaker'] ?? '',
      speakerImg: data['speaker_img'] ?? '',
      speakerDetails: data['speaker_details'] ?? '',
      hourStart: data['hour_start'] ?? '',
      hourEnd: data['hour_end'] ?? '',
      date: data['date'] ?? '',
      congressId: data['congress'] ?? '',
    );
  }
}
