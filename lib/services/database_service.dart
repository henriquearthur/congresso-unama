import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/lecture.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  // Stream<Lecture> streamLecture(String id) {
  //   return _db
  //       .collection('palestras')
  //       .document(id)
  //       .snapshots()
  //       .map((snap) => Lecture.fromFirestore(snap));
  // }

  Stream<List<Lecture>> streamLectures(String date) {
    return _db
        .collection('palestras')
        .where('date', isEqualTo: date)
        .orderBy("hour_start")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Lecture.fromFirestore(doc)).toList());
  }
}
