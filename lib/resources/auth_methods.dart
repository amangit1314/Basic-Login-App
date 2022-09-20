import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/models/user.dart' as model;
import 'package:get/get.dart';

// A class holding auth methods
class AuthMethods {
  // Firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // a future method to get user derails from firebase
  Future<model.User> getUserDetails() async {
    // getting the current user from firebase auth
    User currentUser = _auth.currentUser!;
    // getting the user details from firestore
    final DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    // creating a user model from the snapshot
    return model.User.fromSnap(snap);
  }

  // a future method to register the user from firebase
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //  register user using firebase method {createUserWithEmailAndPassword}
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        model.User user = model.User(
          email: email,
          username: username,
          uid: cred.user!.uid,
        );

        //  add user to our database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = '❗The email is badly formated...';
        GetSnackBar(
          message: '❗The email is badly formated...',
          backgroundColor: Colors.red,
        ).show();
      } else if (err.code == 'weak-password') {
        res = 'Password should be 6 characters long...';
      }
    } catch (err) {
      res = res.toString();
    }
    return res;
  }

  // to login the user
  Future<String> loginUser({required email, required password}) async {
    String res = "❓error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = '❗Please enter both email and password';
      }
    } catch (err) {
      res = res.toString();
    }
    return res;
  }

  // to logout the user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
