import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/settings (1).png'),
            onPressed: () {},
          ),
        ],
      ),
      NotificationItem(
        date: 'منذ 11 دقيقة',
        onTap: () {},
        title: 'قام شهد بالتعليق على المنشور',
        type: NotificationType.Comment,
        username: '@shahd',
        seen: false,
      ),
    ];
    return Scaffold(
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
            Builder(
              builder: (cxt) => IconButton(
                icon: Image.asset('assets/images/list (1).png'),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Image.asset('assets/images/alarm (2).png'),
              onPressed: () {},
            ),
          ],
        ),
        centerWidget: Text('الإعدادات'),
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (cxt, index) => const SizedBox(height: 15),
          itemBuilder: (cxt, index) => listViewItems[index],
          itemCount: listViewItems.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) {},
        currentIndex: 1,
      ),
    );
  }
}

enum NotificationType {
  Message,
  Comment,
  NewPost,
  Support,
}

class NotificationItem extends StatelessWidget {
  final NotificationType type;
  final String title;
  final String username;
  final String date;
  final String imagePath;
  final bool seen;
  final Function onTap;

  const NotificationItem({
    Key key,
    @required this.type,
    @required this.title,
    @required this.username,
    @required this.date,
    this.imagePath: 'assets/images/9876 (6).png',
    @required this.onTap,
    this.seen: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showImageBorder =
        type == NotificationType.Comment || type == NotificationType.NewPost;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: showImageBorder
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                          )
                        : null,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      // width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/9876 (7).png',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            username,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).accentColor,
                )
              ],
            ),
          ),
          if (!seen)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffde4949),
                ),
              ),
            ),
          Positioned(
            top: 5,
            left: 5,
            child: Text(
              date,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}