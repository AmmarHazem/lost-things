import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../styles.dart';
import '../utils.dart';
import '../widgets/message_item.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';

class TechnicalSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      Message(
        date: 'اليوم 11 ص',
        imagePath: 'assets/my_images/help.png',
        text: 'السلام عليكم',
      ),
      Message(
        date: 'اليوم 11 ص',
        imagePath: 'assets/my_images/9876 (6).png',
        text: 'و عليكم السلام',
        isSent: false,
      ),
    ];
    return Scaffold(
      appBar: MyAppBar(
        height: 110,
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
        rightWidget: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Image.asset(
            'assets/my_images/settings (1).png',
            width: 25,
          ),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
        centerWidget: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/my_images/correct (3).png',
                  width: 25,
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).accentColor),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/my_images/help.png',
                    width: 40,
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 10),
            Text('الدعم الفنى'),
            const SizedBox(height: 5),
            Text('@username'),
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
              child: LiveList.options(
                reverse: true,
                options: animatedListOptions,
                separatorBuilder: (cxt, index) => const SizedBox(height: 15),
                itemBuilder: (cxt, index, animation) => buildAnimatedItem(
                  cxt,
                  index,
                  animation,
                  listViewItems[index],
                ),
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
                        'assets/my_images/camera.png',
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
