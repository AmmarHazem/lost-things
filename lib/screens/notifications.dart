import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_button.dart';
import '../utils.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';

class Notifications extends StatelessWidget {
  void _drawerOnTap(int index, BuildContext context) {
    Navigator.pushNamed(context, KDrawerRoutesNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/my_images/settings (1).png'),
            onPressed: () {},
          ),
        ],
      ),
      NotificationItem(
        date: 'منذ 11 دقيقة',
        onTap: () {},
        title: 'قام شهد بالتعليق على المنشور',
        type: NotificationType.Message,
        username: '@shahd',
        seen: false,
        imagePath: 'assets/my_images/pexels-photo-1162519.jpeg',
      ),
      NotificationItem(
        date: 'منذ 11 دقيقة',
        onTap: () {},
        title: 'قام شهد بالتعليق على المنشور',
        type: NotificationType.NewPost,
        username: '@shahd',
      ),
      NotificationItem(
        date: 'منذ 11 دقيقة',
        onTap: () {},
        title: 'قام شهد بالتعليق على المنشور',
        type: NotificationType.Support,
        username: '@shahd',
        imagePath: 'assets/my_images/pexels-photo-583847.jpeg',
      ),
      NotificationItem(
        date: 'منذ 11 دقيقة',
        onTap: () {},
        title: 'قام شهد بالتعليق على المنشور',
        type: NotificationType.Comment,
        username: '@shahd',
      ),
    ];
    return Scaffold(
      drawer: MyDrawer(
        onTap: (int index) => _drawerOnTap(index, context),
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
        rightWidget: OpenDrawerButton(),
        centerWidget: Text('التنبيهات'),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          positionedCircle,
          SafeArea(
            child: LiveList.options(
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
                vertical: 15,
                horizontal: 15,
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
    this.imagePath: 'assets/my_images/9876 (6).png',
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
              horizontal: 20,
              vertical: 20,
            ),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: showImageBorder
                        ? const EdgeInsets.all(8)
                        : const EdgeInsets.all(0),
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
                      // width: 10,
                      // height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/my_images/9876 (7).png',
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
            top: 3,
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
