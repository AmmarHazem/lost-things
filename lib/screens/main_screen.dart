import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_drawer.dart';
import 'main_tabs/home.dart';
import 'main_tabs/messages.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;
  List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _tabs = [
      Center(
        child: Text('Add Tab'),
      ),
      HomeTab(),
      MessagesTab(goBack: _goBack),
    ];
  }

  void _drawerOnTap(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, 'edit-profile');
    } else if (index == 1) {
      Navigator.pushNamed(context, 'add-post');
    } else if (index == 2) {
      Navigator.pushNamed(context, 'favourites');
    } else if (index == 3) {
      Navigator.pushNamed(context, 'tech-support');
    } else if (index == 4) {
      Navigator.pushNamed(context, 'terms-and-conditions');
    } else if (index == 5) {
      Navigator.pushNamed(context, 'settings');
    }
  }

  bool _goBack() {
    if (_currentIndex != 1) {
      setState(() {
        _currentIndex = 1;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _goBack(),
      child: Scaffold(
        drawer: MyDrawer(onTap: _drawerOnTap),
        body: SafeArea(
          top: false,
          child: Stack(
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: _tabs[_currentIndex],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MyBottomNavbar(
                  onTap: (index) {
                    if(index == 0) {
                      Navigator.pushNamed(context, 'add-post');
                      return;
                    }
                    setState(() => _currentIndex = index);
                  },
                  currentIndex: _currentIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
