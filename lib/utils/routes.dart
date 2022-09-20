import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/providers/user_provider.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:get/get.dart';

class Routes extends GetWidget<AuthController> {
  static String id = "routes";
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserProvider>(UserProvider());
      },
      builder: (_) {
        if (Get.find<UserProvider>().getUser == null) {
          return LogInPage();
        }
        return HomePage();
      },
    );
  }
}
