import 'package:flutter/material.dart';

import '../widgets/drawer_button.dart';
import '../widgets/my_drawer.dart';
import '../widgets/open_notifications_button.dart';
import '../utils.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';

class TermsAndConditions extends StatelessWidget {
  final _drawerIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onTap: (int index) => drawerOnTap(index, _drawerIndex, context),
      ),
      appBar: MyAppBar(
        height: 50,
        leftWidget: SizedBox(
          width: 40,
          child: FlatButton(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        rightWidget: Row(
          children: <Widget>[
            const SizedBox(width: 10),
            OpenDrawerButton(),
            OpenNotificationsButton(),
          ],
        ),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          positionedCircle,
          SafeArea(
            child: LayoutBuilder(
              builder: (cxt, constraints) => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 9,
                          ),
                          child: Text('الشروط و الأحكام'),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) => Navigator.pushNamedAndRemoveUntil(
          context,
          'main',
          (route) => false,
          arguments: {
            'tabIndex': index,
          },
        ),
        currentIndex: 1,
      ),
    );
  }
}
