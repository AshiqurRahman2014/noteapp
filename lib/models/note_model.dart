import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String userId;
  final String title;
  final String description;

  Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
  });

  factory Note.fromSnapshot(DocumentSnapshot snapshot) {
    return Note(
      id: snapshot.id,
      userId: snapshot['userId'],
      title: snapshot['title'],
      description: snapshot['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
    };
  }
}
