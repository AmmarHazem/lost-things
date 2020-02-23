import 'package:flutter/material.dart';

import '../screens/main_tabs/add_post.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_drawer.dart';
import 'main_tabs/home.dart';
import 'main_tabs/messages.dart';
import '../utils.dart';

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
    _tabs = [
      AddPostTab(goBack: _goBack),
      HomeTab(),
      MessagesTab(goBack: _goBack),
    ];

    Future.delayed(Duration.zero, () {
      final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
      setState(() {
        _currentIndex = args['tabIndex'] == null ? 1 : args['tabIndex'];
      });
    });
  }

  void _drawerOnTap(int index) =>
      Navigator.pushNamed(context, KDrawerRoutesNames[index]);

  bool _goBack() {
    if (_currentIndex != 1) {
      setState(() {
        _currentIndex = 1;
      });
      return false;
    }
    return true;
  }

  void _bottomNavbarOnTap(int index) {
    setState(() => _currentIndex = index);
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
                  onTap: _bottomNavbarOnTap,
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
