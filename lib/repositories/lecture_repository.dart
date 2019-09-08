import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/models/lecture.dart';
import 'package:congresso_unama/repositories/congress_repository.dart';

class LectureRepository {
  final Firestore _db = Firestore.instance;
  final CongressRepository _congressRepository = CongressRepository();

  Stream<List<Lecture>> getLectures(String date) {
    return _db
        .collection('2019_palestras')
        .where('date', isEqualTo: date)
        .orderBy("hour_start")
        .snapshots()
        .asyncMap((list) async {
      List<Congress> congresses =
          await _congressRepository.getCongressesAsList();
      return list.documents.map((doc) {
        Lecture lecture = Lecture.fromFirestore(doc);
        Congress congress = congresses
            .where((congress) => congress.id == lecture.congressId)
            .last;

        lecture.congress = congress;

        return lecture;
      }).toList();
    });
  }
}
