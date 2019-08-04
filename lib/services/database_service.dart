import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/event.dart';
import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/models/speaker.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Stream<List<Lecture>> streamLectures() {
    return _db.collection('palestras').orderBy("hour_start").snapshots().map(
        (list) =>
            list.documents.map((doc) => Lecture.fromFirestore(doc)).toList());
  }

  Stream<Event> streamEventData(String event) {
    return _db
        .collection('eventos')
        .document(event)
        .snapshots()
        .map((snap) => Event.fromFirestore(snap));
  }

  Stream<List<Speaker>> streamEventSpeakers(String event) {
    // TODO: Add new logic on Data Fetcher to eliminate duplicated speakers
    return _db
        .collection('palestras')
        .where("event", isEqualTo: event)
        .where("speaker", isGreaterThan: "")
        .orderBy("speaker")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Speaker.fromFirestore(doc)).toList());
  }
}
