import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../widgets/open_notifications_button.dart';
import '../widgets/drawer_button.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/post_options.dart';
import '../widgets/my_appbar.dart';
import '../widgets/comment_item.dart';
import '../widgets/section_title.dart';
import '../utils.dart';

class FoundPostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = const EdgeInsets.symmetric(horizontal: 15);
    final List<Widget> listViewItems = [
      Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'هاتف محمول',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        'ضاع منى جوالى بالحديقة العامة بالرياض أرجو من يعثر علية التواصل معى',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).accentColor,
                    ),
                    const SizedBox(width: 5),
                    FlatButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      child: Text(
                        'المملكة العربية السعودية',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: Text(
                    'تم العثور عليه',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PostOptions(
          onSharePressed: () => showShareDialog(context),
        ),
      ),
      Padding(
        padding: horizontalPadding,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/my_images/9876 (6).png',
                width: 30,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ياسر',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '@yaser',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      SectionTitle(title: 'التعليقات (13)'),
      const SizedBox(height: 20),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
      Container(
        height: 1,
        color: Colors.grey,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
      Container(
        height: 1,
        color: Colors.grey,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
    ];
    return Scaffold(
      drawer: MyDrawer(onTap: (int index) => drawerOnTap(index, -1, context)),
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
      body: SafeArea(
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
          padding: const EdgeInsets.only(top: 15, bottom: 15),
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
      ),
    );
  }
}
