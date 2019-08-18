import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/congress.dart';

class CongressRepository {
  final Firestore _db = Firestore.instance;

  Stream<Congress> getCongress(String congress) {
    return _db
        .collection('eventos')
        .document(congress)
        .snapshots()
        .map((snap) => Congress.fromFirestore(snap));
  }
}
