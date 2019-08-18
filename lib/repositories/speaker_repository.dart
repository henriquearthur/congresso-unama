import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/models/speaker.dart';

class SpeakerRepository {
  final Firestore _db = Firestore.instance;

  Stream<List<Speaker>> getConressSpeakers(Congress congress) {
    // TODO: Add new logic on Data Fetcher to eliminate duplicated speakers
    return _db
        .collection('palestras')
        .where("event", isEqualTo: congress.id)
        .where("speaker", isGreaterThan: "")
        .orderBy("speaker")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Speaker.fromFirestore(doc)).toList());
  }
}
