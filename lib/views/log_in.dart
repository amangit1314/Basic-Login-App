import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/views/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LogInPage extends GetWidget<AuthController> {
  static String id = "login_in_screen";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 75),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/images/7.jpg'),
                  ),
                  SizedBox(height: 24),
                  Text(
                    " Welcome here Buddy!",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PT Sans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "You should Sign In!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PT Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "email or username",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          prefixIcon: Icon(Icons.mail_outline),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          prefixIcon: FaIcon(FontAwesomeIcons.key),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
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
                            controller.login(
                                emailController.text, passwordController.text);
                          },
                        ),
                      ),
                      SizedBox(height: 14),
                      Column(
                        children: [
                          SizedBox(width: 100),
                          IconButton(
                            onPressed: () {
                              controller.signInWithGoogle();
                            },
                            icon: Image.asset("assets/images/google.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
