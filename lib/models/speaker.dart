import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Speaker extends Equatable {
  final String id;
  final String name;
  final String image;
  final String details;

  Speaker({this.id, this.name, this.image, this.details}) : super([name]);

  factory Speaker.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Speaker(
      id: doc.documentID,
      name: data['speaker'] ?? '',
      image: data['speaker_img'] ?? '',
      details: data['speaker_details'] ?? '',
    );
  }
}
