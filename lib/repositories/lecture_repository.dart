import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/lecture.dart';

class LectureRepository {
  final Firestore _db = Firestore.instance;

  Stream<List<Lecture>> getLectures(String date) {
    return _db
        .collection('palestras')
        .where('date', isEqualTo: date)
        .orderBy("hour_start")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Lecture.fromFirestore(doc)).toList());
  }
}
