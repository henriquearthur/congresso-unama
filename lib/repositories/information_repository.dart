import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/information.dart';

class InformationRepository {
  final Firestore _db = Firestore.instance;

  Stream<Information> getInformation() {
    return _db
        .collection('4_congresso_nacional_ciencias_exatas_e_tecnologia')
        .document('informacoes')
        .snapshots()
        .map((snap) => Information.fromFirestore(snap));
  }
}
