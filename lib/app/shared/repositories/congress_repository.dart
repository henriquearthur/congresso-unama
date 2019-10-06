import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';

class CongressRepository {
  final Firestore _db = Firestore.instance;
  final String _collection = '2019_v1.1_congressos';

  Stream<List<Congress>> getCongresses() {
    return _db
        .collection(_collection)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents
          .map((congress) => Congress.fromFirestore(congress))
          .toList();
    });
  }

  Future<List<Congress>> getCongressesAsList() async {
    QuerySnapshot documents = await _db.collection(_collection).getDocuments();
    List<Congress> congresses = documents.documents
        .map((document) => Congress.fromFirestore(document))
        .toList();

    return congresses;
  }
}
