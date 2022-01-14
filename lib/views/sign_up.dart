import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/controller/auth_controller.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  static String id = "sign_up_screen";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

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
                  Column(
                    children: [
                      SizedBox(height: 55),
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/7.jpg'),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Registeration Portal",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PT Sans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        child: Text(
                          "Register here please!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PT Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          prefixIcon: Icon(CupertinoIcons.profile_circled),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email ",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.4,
                          ),
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password ",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.4,
                          ),
                          prefixIcon: const FaIcon(FontAwesomeIcons.key),
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        obscureText: true,
                        controller: confirmpasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password ",
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(12)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0.4),
                          prefixIcon: Icon(Icons.verified_outlined),
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
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
                              Get.to(() => LogInPage());
                            },
                            child: Text(
                              "Log In Instead!",
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
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'PT Sans',
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          onPressed: () {
                            AuthController().createUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                        ),
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
