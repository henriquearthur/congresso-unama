import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/speaker.dart';

class SpeakerRepository {
  final Firestore _db = Firestore.instance;

  Stream<List<Speaker>> getSpeakers(Congress congress) {
    return _db
        .collection('2019_v1.1_palestras')
        .where("congress", isEqualTo: congress.id)
        .where("speaker_name", isGreaterThan: "")
        .orderBy("speaker_name")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Speaker.fromFirestore(doc)).toList());
  }
}
