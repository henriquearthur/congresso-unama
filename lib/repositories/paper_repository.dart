import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/paper.dart';

class PaperRepository {
  final Firestore _db = Firestore.instance;

  Stream<List<Paper>> getPapers(String date) {
    return _db
        .collection('graduandos')
        .where('date', isEqualTo: date)
        .orderBy("hour_start")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Paper.fromFirestore(doc)).toList());
  }
}
