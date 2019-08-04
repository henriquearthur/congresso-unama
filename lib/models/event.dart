import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String description;

  Event({this.id, this.description});

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Event(
      id: doc.documentID,
      description: data['description'] ?? '',
    );
  }
}
