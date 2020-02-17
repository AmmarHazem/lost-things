import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/my_appbar.dart';
import 'tabs/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: 120,
        rightWidget: Row(
          children: <Widget>[
            const SizedBox(width: 10),
            IconButton(
              icon: Image.asset('assets/images/list (1).png'),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Image.asset('assets/images/alarm (2).png'),
              onPressed: () {},
            ),
          ],
        ),
        leftWidget: SizedBox(
          width: 60,
          child: FlatButton(
            padding: const EdgeInsets.only(top: 8),
            shape: CircleBorder(),
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(7),
              child: Icon(
                FontAwesomeIcons.userAlt,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        bottomWidget: LayoutBuilder(
          builder: (cxt, constraints) => Column(
            children: <Widget>[
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: constraints.maxWidth * 0.2,
                  // ),
                  width: constraints.maxWidth * 0.65,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/search (1).png',
                        width: 30,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'بحث',
                        style: TextStyle(color: Colors.grey[400]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: HomeTab(),
      ),
    );
  }
}