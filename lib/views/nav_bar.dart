import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/views/favourites_page.dart';
import 'package:flutter_firebase_login/views/home_page.dart';
import 'package:flutter_firebase_login/views/profile.dart';
import 'package:flutter_firebase_login/views/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List pages = [HomePage(), SearchPage(), FavouritesPage(), ProfilePage()];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          SalomonBottomBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            title: Text('Home'),
            selectedColor: Colors.blueAccent,
          ),
          SalomonBottomBarItem(
              icon: Icon(Icons.search_outlined),
              title: Text('Search'),
              selectedColor: Colors.deepPurple),
          SalomonBottomBarItem(
              icon: Icon(Icons.favorite_outline),
              title: Text('Your Library'),
              selectedColor: Colors.pink),
          SalomonBottomBarItem(
            icon: FaIcon(FontAwesomeIcons.person),
            title: Text('Accessibility'),
            selectedColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
