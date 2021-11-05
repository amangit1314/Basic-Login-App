import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  // late PageController _pageController;
  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
      currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
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
            icon: Icon(Icons.accessibility_new_outlined),
            title: Text('Accessibility'),
            selectedColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
