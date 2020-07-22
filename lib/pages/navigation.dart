import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:boringmusicapp/colors.dart';
import 'package:boringmusicapp/pages/home_page.dart';
import 'package:boringmusicapp/pages/library_page.dart';
import 'package:boringmusicapp/pages/search_page.dart';

class Navigation extends StatefulWidget {
  static const String id = 'bottom_bar';
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static List<Widget> _pagelist = <Widget>[
    HomePage(),
    LibraryPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _pagelist[_selectedIndex],
          //        child: _pagelist.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('Library'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: PrimaryPurple,
          selectedItemColor: White,
          unselectedItemColor: UnselectedIconPurple,
        ),
      ),
    );
  }
}
