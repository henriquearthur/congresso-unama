import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'congress.dart';

class Lecture {
  final String id;
  final String title;
  final String description;
  final String type;
  final String tag;
  final String speakerName;
  final String speakerImg;
  final String speakerDetails;
  final String hourStart;
  final String hourEnd;
  final String congressId;
  final DateTime date;
  Congress congress;

  Lecture(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.tag,
      this.speakerName,
      this.speakerImg,
      this.speakerDetails,
      this.hourStart,
      this.hourEnd,
      this.congressId,
      this.date,
      this.congress});

  String getFullDate() =>
      DateFormat("EEEE',' d 'de' MMMM", 'pt_BR').format(date);

  factory Lecture.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    DateTime date;

    if (data['date'] != null) {
      List<String> dateArr = data['date'].split('-');
      int dateDay = int.parse(dateArr[0]);
      int dateMonth = int.parse(dateArr[1]);
      int dateYear = int.parse(dateArr[2]);

      date = DateTime(dateYear, dateMonth, dateDay);
    }

    return Lecture(
      id: doc.documentID,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      type: data['type'] ?? '',
      tag: data['tag'] ?? null,
      speakerName: data['speaker_name'] ?? '',
      speakerImg: data['speaker_img'] ?? '',
      speakerDetails: data['speaker_details'] ?? '',
      hourStart: data['hour_start'] ?? '',
      hourEnd: data['hour_end'] ?? '',
      date: date ?? '',
      congressId: data['congress'] ?? '',
    );
  }
}
