import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/controller/user_controller.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:get/get.dart';

class Routes extends GetWidget<AuthController> {
  static String id = "routes";
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user == null) {
          return LogInPage();
        } else {
          return HomePage();
        }
      },
    );
  }
}
