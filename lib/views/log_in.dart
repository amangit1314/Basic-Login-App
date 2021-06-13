import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/views/sign_up.dart';
import 'package:get/get.dart';

class LogInPage extends GetWidget<AuthController> {
  static String id = "login_in_screen";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/7.jpg'),
              ),
              SizedBox(height: 14),
              Text(
                "Let's sign in Welcome back",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PT Sans',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "You've been missed!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PT Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "email or username",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                  ),
                  prefixIcon: Icon(CupertinoIcons.mail),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0.5,
                  ),
                ),
              ),
              SizedBox(height: 14),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(12)),
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0.5,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 190),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignUpPage());
                    },
                    child: Text(
                      "Sign Up Instead!",
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                ),
                child: MaterialButton(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                  onPressed: () {
                    controller.login(emailController.text, passwordController.text);
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
