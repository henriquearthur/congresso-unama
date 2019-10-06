import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/paper.dart';

import 'congress_repository.dart';

class PaperRepository {
  final Firestore _db = Firestore.instance;
  final CongressRepository _congressRepository = CongressRepository();

  final String _collection = '2019_v1.1_trabalhos';

  Stream<List<Paper>> getPapers(String date) {
    return _db
        .collection(_collection)
        .where('date', isEqualTo: date)
        .orderBy("hour")
        .snapshots()
        .asyncMap((list) async {
      List<Congress> congresses =
          await _congressRepository.getCongressesAsList();
      return list.documents.map((doc) {
        Paper paper = Paper.fromFirestore(doc);
        Congress congress = congresses
            .where((congress) => congress.id == paper.congressId)
            .last;

        paper.congress = congress;

        return paper;
      }).toList();
    });
  }
}
