import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/message_item.dart';
import '../styles.dart';

class Conversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      Message(
        date: 'اليوم 11 ص',
        imagePath: 'assets/images/help.png',
        text: 'السلام عليكم',
      ),
      Message(
        date: 'اليوم 11 ص',
        imagePath: 'assets/images/9876 (6).png',
        text: 'و عليكم السلام',
        isSent: false,
      ),
    ];
    return Scaffold(
      drawer: LayoutBuilder(
        builder: (cxt, constraints) => Padding(
          padding: EdgeInsets.only(top: constraints.maxHeight * 0.2),
          child: Column(
            children: <Widget>[
              Container(
                width: constraints.maxWidth * 0.75,
                height: 100,
                decoration: BoxDecoration(
                color: grey1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/trash.png',
                            width: 30,
                          ),
                          const SizedBox(width: 10),
                          Text('حذف الدردشة'),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[400],
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, 'blocked-accounts'),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/block.png',
                            width: 30,
                          ),
                          const SizedBox(width: 10),
                          Text('حظر المستخدم'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: MyAppBar(
        height: 60,
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
        rightWidget: Builder(
          builder: (cxt) => IconButton(
            padding: const EdgeInsets.all(0),
            icon: Image.asset(
              'assets/images/settings (1).png',
              width: 25,
            ),
            onPressed: () => Scaffold.of(cxt).openDrawer(),
            color: Theme.of(context).accentColor,
          ),
        ),
        centerWidget: Column(
          children: <Widget>[
            Text('سارة'),
            const SizedBox(height: 5),
            Text('@sarah'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.separated(
                reverse: true,
                separatorBuilder: (cxt, index) => const SizedBox(height: 15),
                itemBuilder: (cxt, index) => listViewItems[index],
                itemCount: listViewItems.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              height: 60,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 35,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Image.asset(
                        'assets/images/camera.png',
                        width: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: textFieldDecoration.copyWith(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey[350],
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey[350],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey[350],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) {},
        currentIndex: 1,
      ),
    );
  }
}
