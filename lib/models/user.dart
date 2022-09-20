import 'package:cloud_firestore/cloud_firestore.dart';

// a user model to separate the data from the database
class User {
  final String email;
  final String uid;
  final String? photoUrl;
  final String username;

  // constructor of the User model class
  const User({
    required this.email,
    required this.uid,
    this.photoUrl,
    required this.username,
  });

  // mapping method to map the data into JSON format
  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': username,
      };

  // a method to create a user model from the snapshot
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'] as String,
      uid: snapshot['uid'] as String,
      photoUrl: snapshot['photoUrl'] as String,
      username: snapshot['username'] as String,
    );
  }
}
