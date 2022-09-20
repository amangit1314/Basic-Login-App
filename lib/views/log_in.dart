import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/resources/auth_methods.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/sign_up.dart';
import 'package:flutter_firebase_login/widgets/text_field_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  static String id = "login_in_screen";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false,
      );
    } else {
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
        child: Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                child: Expanded(
                  child: ListView(
                    shrinkWrap: true,
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
                              left: 30.0,
                              right: 30.0,
                              top: 20,
                            ),
                            child: Column(
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: 'Welcome Here',
                                    children: [
                                      TextSpan(
                                        text: ' Buddy!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
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
                                  "Please Sign In here to continue!",
                                  textAlign: TextAlign.center,
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
                                  children: <Widget>[
                                    TextFieldInput(
                                      textEditingController: _emailController,
                                      hintText: "Email",
                                      textInputType: TextInputType.emailAddress,
                                      prefixIcon: FontAwesomeIcons.envelope,
                                      iconColor: Colors.black54,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 0.7),
                                    ),
                                    SizedBox(height: 20),
                                    TextFieldInput(
                                      textEditingController:
                                          _passwordController,
                                      hintText: "Password",
                                      textInputType: TextInputType.emailAddress,
                                      prefixIcon: FontAwesomeIcons.key,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 0.7),
                                      iconColor: Colors.black54,
                                      isPass: true,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Forgot Password?",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(36.0),
                                        border: Border.all(color: Colors.white),
                                        color: Colors.black,
                                      ),
                                      child: MaterialButton(
                                        child: Text(
                                          'Log In',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                        onPressed: () => loginUser(),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            "assets/images/google.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Dont have an account?",
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
                                            Get.to(() => SignUpPage());
                                          },
                                          child: Text(
                                            "Sign Up Instead!",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
