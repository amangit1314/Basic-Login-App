import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/resources/auth_methods.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:flutter_firebase_login/widgets/text_field_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  static String id = "sign_up_screen";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {
    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _nameController.text,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      // navigate to the home screen
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // show the error
      // ignore: use_build_context_synchronously
      GetSnackBar(
        message: res.toString(),
        backgroundColor: Colors.red,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              height: 150,
                              width: double.infinity,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2020/12/21/19/05/window-5850628__480.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 75),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 45,
                                      child: CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage:
                                            AssetImage('assets/images/2.jpg'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 15),
                          child: Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Register ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Here Please!',
                                    ),
                                  ],
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Register yourself in our app here to continue!",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  TextFieldInput(
                                    textEditingController: _nameController,
                                    hintText: "Full Name",
                                    textInputType: TextInputType.emailAddress,
                                    prefixIcon: FontAwesomeIcons.person,
                                    iconColor: Colors.black54,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0.4),
                                  ),
                                  SizedBox(height: 14),
                                  TextFieldInput(
                                    textEditingController: _emailController,
                                    hintText: "Email",
                                    textInputType: TextInputType.emailAddress,
                                    prefixIcon: FontAwesomeIcons.envelope,
                                    iconColor: Colors.black54,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0.4),
                                  ),
                                  SizedBox(height: 14),
                                  TextFieldInput(
                                    isPass: true,
                                    textEditingController: _passwordController,
                                    hintText: "Password",
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    prefixIcon: FontAwesomeIcons.key,
                                    iconColor: Colors.black54,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0.4),
                                    sufixIcon: hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 14),
                                  TextFieldInput(
                                    isPass: true,
                                    textEditingController:
                                        _confirmPasswordController,
                                    hintText: "Confirm Password",
                                    textInputType: TextInputType.emailAddress,
                                    prefixIcon: Icons.verified_outlined,
                                    iconColor: Colors.black54,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0.4),
                                    sufixIcon: hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    height: 55,
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
                                      onPressed: () => signUpUser(),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.to(() => LogInPage());
                                        },
                                        child: Text(
                                          "Log in Instead!",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
