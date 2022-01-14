import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/widgets/drawer.dart';
import 'package:flutter_firebase_login/widgets/nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  static String id = "Home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Firebase Login App",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: 'PT Sans'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: FaIcon(FontAwesomeIcons.signOutAlt),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   child: GridView.count(
              //     crossAxisCount: 3,
              //     mainAxisSpacing: 5,
              //     crossAxisSpacing: 5,
              //     children: [],
              //   ),
              // ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Text("Amazing🤩"),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
      drawer: MyDrawer(),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          child: Icon(
            Icons.favorite_border,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
