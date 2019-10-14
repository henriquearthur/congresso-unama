import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/app/shared/models/congress.dart';
import 'package:congresso_unama/app/shared/models/lecture.dart';

import 'congress_repository.dart';

class LectureRepository {
  final Firestore _db = Firestore.instance;
  final CongressRepository _congressRepository = CongressRepository();

  final String _collection = '2019_v1.1_palestras';

  Stream<List<Lecture>> getLectures(Congress congress) {
    return _db
        .collection(_collection)
        .where('congress', isEqualTo: congress.id)
        .orderBy("hour_start")
        .snapshots()
        .asyncMap((list) async {
      List<Congress> congresses =
          await _congressRepository.getCongressesAsList();
      return list.documents.map((doc) {
        Lecture lecture = Lecture.fromFirestore(doc);
        Congress congress = congresses
            .where((congress) => congress.id == lecture.congressId)
            .single;

        lecture.congress = congress;

        return lecture;
      }).toList();
    });
  }
}
