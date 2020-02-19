import 'package:flutter/material.dart';
import 'package:raneem/styles.dart';

import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';

class TechnicalSupport extends StatelessWidget {
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
            'assets/images/settings (1).png',
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
                  'assets/images/correct (3).png',
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
                    'assets/images/help.png',
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

class Message extends StatelessWidget {
  final bool isSent;
  final String text;
  final String imagePath;
  final String date;

  const Message({
    Key key,
    this.isSent: true,
    @required this.text,
    @required this.imagePath,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = 20.0;
    final userImage = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSent
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        imagePath,
        height: 30,
      ),
    );
    return LayoutBuilder(
      builder: (cxt, constraints) => Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          if (isSent) userImage,
          if (isSent) const SizedBox(width: 5),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.5),
                  decoration: BoxDecoration(
                    color: isSent
                        ? Theme.of(context).accentColor
                        : Colors.grey[350],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: isSent
                          ? Radius.circular(borderRadius)
                          : Radius.circular(0),
                      bottomRight: !isSent
                          ? Radius.circular(borderRadius)
                          : Radius.circular(0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text(
                    text,
                    style:
                        TextStyle(color: isSent ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          if (!isSent) const SizedBox(width: 5),
          if (!isSent) userImage,
        ],
      ),
    );
  }
}
