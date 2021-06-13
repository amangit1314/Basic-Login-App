import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/controller/user_controller.dart';
import 'package:flutter_firebase_login/services/database.dart';
import 'package:flutter_firebase_login/widgets/drawer.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pink,
            Colors.pink,
            Colors.pink,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: GetX<UserController>(
            initState: (_) async {
              Get.find<UserController>().user =
                  await Database().getUser(Get.find<AuthController>().user!.uid);
            },
            builder: (_) {
              if (_.user.name != null) {
                return Text("Welcome " + _.user.name);
              } else {
                return Text("loading...");
              }
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(),
        drawer: MyDrawer(),
      ),
    );
  }
}
