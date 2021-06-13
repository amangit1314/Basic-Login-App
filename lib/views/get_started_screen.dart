import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatelessWidget {
  static String id = "get_started_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage('assets/images/login.png')),
            Text(
              "Welcome to Registration Portal",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PT Sans',
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 45,
              decoration: BoxDecoration(
                // boxShadow: [
                //   //background color of box
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 18.0, // soften the shadow
                //     spreadRadius: 2.0, //extend the shadow
                //     offset: Offset(
                //       5.0, // Move to right 10  horizontally
                //       5.0, // Move to bottom 10 Vertically
                //     ),
                //  ),
                //],
                borderRadius: BorderRadius.circular(36.0),
                border: Border.all(color: Colors.white),
                color: Colors.black,
              ),
              child: MaterialButton(
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'PT Sans',
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                onPressed: () {
                  Get.to(LogInPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
