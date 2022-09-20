import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/providers/user_provider.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:flutter_firebase_login/views/nav_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
    // this.isOnboarded = false,
  }) : super(key: key);
  bool isOnboarded = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: GetMaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Fire Login',
        theme: ThemeData.light(),
        // theme: MyTheme.lightTheme(context),
        // darkTheme: MyTheme.darkTheme(context),
        home:
            // widget.isOnboarded
            //     ? GetStartedScreen()
            //     :
            StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return NavBar();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasn't been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            // setState(() {
            //   widget.isOnboarded = !widget.isOnboarded;
            // });
            return LogInPage();
          },
        ),
      ),
    );
  }
}
