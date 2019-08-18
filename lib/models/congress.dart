import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Congress extends Equatable {
  final String id;
  final String description;

  Congress({this.id, this.description}) : super([id, description]);

  factory Congress.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Congress(
      id: doc.documentID,
      description: data['description'] ?? '',
    );
  }
}
