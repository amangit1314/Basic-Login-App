import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<AuthController> {
  static String id = "sign_up_screen";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/7.jpg'),
              ),
              SizedBox(height: 2),
              Text(
                "Register yourself",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PT Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                  ),
                  prefixIcon: Icon(CupertinoIcons.mail),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0.4,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password ",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0.4,
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                ),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Get.to(() => LogInPage());
                },
                child: Text(
                  "Login Instead!",
                  style: TextStyle(
                    fontFamily: 'PT Sans',
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                  onPressed: () {
                    controller.createUser(
                        emailController.text, passwordController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
