import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/bindings/auth_binding.dart';
import 'package:flutter_firebase_login/utils/routes.dart';
import 'package:flutter_firebase_login/views/get_started_screen.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/widgets/themes.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Fire Login',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
    );
  }
}
