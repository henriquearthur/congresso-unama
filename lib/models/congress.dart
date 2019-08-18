import 'package:cloud_firestore/cloud_firestore.dart';

class Congress {
  final String id;
  final String description;

  Congress({this.id, this.description});

  factory Congress.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Congress(
      id: doc.documentID,
      description: data['description'] ?? '',
    );
  }
}
