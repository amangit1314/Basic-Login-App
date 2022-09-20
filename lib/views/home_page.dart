import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/resources/auth_methods.dart';
import 'package:flutter_firebase_login/views/log_in.dart';
import 'package:flutter_firebase_login/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  static String id = "Home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => MyDrawer(),
        ),
        title: Text(
          "Firebase Login App",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: 'PT Sans'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LogInPage(),
                ),
              );
            },
            icon:
                FaIcon(FontAwesomeIcons.rightFromBracket, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListView(
              children: [
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Technologies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.only(right: 15),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          height: 75,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Projects",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 30,
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
