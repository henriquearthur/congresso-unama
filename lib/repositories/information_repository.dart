import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/location.dart';

class InformationRepository {
  final Firestore _db = Firestore.instance;

  Stream<Location> getLocation() {
    return _db
        .collection('informacoes')
        .document('localizacao')
        .snapshots()
        .map((snap) => Location.fromFirestore(snap));
  }
}
