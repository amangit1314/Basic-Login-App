import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_login/models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).setData({
        "name": user.name,
        "email": user.email,
        "password": user.password,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(docsSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
