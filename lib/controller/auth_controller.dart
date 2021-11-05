import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/user_controller.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value!.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  //! Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else
          return LogInPage();
      },
    );
  }

  //! Creating User
  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        "message",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! Login Function
  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        "message",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //! Login in with GOOGLE
  Future<void> signInWithGoogle() async {
    try {
      Get.dialog(Center(child: LogInPage()), barrierDismissible: false);
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      _firebaseUser = userCredentialData.user as Rxn<User>;
      update();
      Get.back();
      Get.to(HomePage());
    } catch (ex) {
      Get.back();
      Get.snackbar(
        "Sign in Error",
        "Error Signing in",
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
    }
  }

  //! Sign out Function
  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        "message",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
