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

  Stream<List<Congress>> getCongresses() {
    return _db
        .collection('2019_congressos')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents
          .map((congress) => Congress.fromFirestore(congress))
          .toList();
    });
  }

  Future<List<Congress>> getCongressesAsList() async {
    QuerySnapshot documents =
        await _db.collection('2019_congressos').getDocuments();
    List<Congress> congresses = documents.documents
        .map((document) => Congress.fromFirestore(document))
        .toList();

    return congresses;
  }

  Future<List<String>> getCongressesId() async {
    QuerySnapshot documents =
        await _db.collection('2019_congressos').getDocuments();
    List<String> congressesId =
        documents.documents.map((document) => document.documentID).toList();

    return congressesId;
  }
}
