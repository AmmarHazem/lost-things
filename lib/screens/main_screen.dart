import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_drawer.dart';
import 'main_tabs/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void _drawerOnTap(int index){
    if(index == 0) {
      Navigator.pushNamed(context, 'edit-profile');
    }
    else if(index == 1) {
      Navigator.pushNamed(context, 'add-post');
    }
    else if(index == 2) {
      Navigator.pushNamed(context, 'favourites');
    }
    else if(index == 3) {
      Navigator.pushNamed(context, 'tech-support');
    }
    else if(index == 4) {
      Navigator.pushNamed(context, 'terms-and-conditions');
    }
    else if(index == 5) {
      Navigator.pushNamed(context, 'settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(onTap: _drawerOnTap),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            HomeTab(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyBottomNavbar(
                onTap: (index) {},
                currentIndex: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
