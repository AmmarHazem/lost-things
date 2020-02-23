import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils.dart';
import '../../widgets/drawer_button.dart';
import '../../widgets/open_notifications_button.dart';
import '../../widgets/my_alert_dialog.dart';
import '../../widgets/section_title.dart';
import '../../widgets/my_appbar.dart';

class MessagesTab extends StatelessWidget {
  final Function goBack;

  const MessagesTab({Key key, @required this.goBack}) : super(key: key);

  Future<bool> _showDeleteConversationDialog(
      BuildContext context, DismissDirection direction) async {
    return showDialog<bool>(
      context: context,
      builder: (cxt) => MyAlertDialog(
        title: Expanded(
          child: Text(
            'هل أنت متأكد من حذف هذه المحادثة ؟',
            style: Theme.of(context).textTheme.body1,
            textAlign: TextAlign.center,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Colors.white,
                child: Text('نعم'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                color: Theme.of(context).primaryColor,
              ),
              // const SizedBox(height: 15),
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textColor: Theme.of(context).primaryColor,
                child: Text('لا'),
                onPressed: () {
                  Navigator.pop(
                    context,
                    false,
                  );
                },
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = const EdgeInsets.symmetric(horizontal: 15);
    final List<Widget> listViewItems = [
      SectionTitle(
        title: 'رسالتين جديدتين',
        centerTitle: true,
      ),
      Dismissible(
        key: ValueKey('1'),
        confirmDismiss: (direction) =>
            _showDeleteConversationDialog(context, direction),
        background: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        direction: DismissDirection.endToStart,
        child: Padding(
          padding: horizontalPadding,
          child: ConversationItem(
            date: 'منذ دقيقة',
            onTap: () => Navigator.pushNamed(context, 'conversation'),
            title: 'شهد',
            lastMessage: 'السلام عليك',
            seen: false,
          ),
        ),
      ),
      Padding(
        padding: horizontalPadding,
        child: ConversationItem(
          date: 'منذ دقيقة',
          onTap: () {},
          title: 'شهد',
          lastMessage: 'السلام عليك',
          seen: false,
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: horizontalPadding,
        child: ConversationItem(
          date: 'منذ دقيقة',
          onTap: () {},
          title: 'شهد',
          lastMessage: 'السلام عليك',
        ),
      ),
      Padding(
        padding: horizontalPadding,
        child: ConversationItem(
          date: 'منذ دقيقة',
          onTap: () {},
          title: 'شهد',
          lastMessage: 'السلام عليك',
        ),
      ),
      Padding(
        padding: horizontalPadding,
        child: ConversationItem(
          date: 'منذ دقيقة',
          onTap: () {},
          title: 'شهد',
          lastMessage: 'السلام عليك',
        ),
      ),
      Padding(
        padding: horizontalPadding,
        child: ConversationItem(
          date: 'منذ دقيقة',
          onTap: () {},
          title: 'شهد',
          lastMessage: 'السلام عليك',
        ),
      ),
    ];
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: -60,
          left: -70,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            MyAppBar(
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
                  onPressed: goBack,
                ),
              ),
              rightWidget: Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                  OpenDrawerButton(),
                  OpenNotificationsButton(),
                ],
              ),
              centerWidget: Text('الرسائل'),
            ),
            Expanded(
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
                padding: const EdgeInsets.only(top: 15, bottom: 80),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ConversationItem extends StatelessWidget {
  final String title;
  final String lastMessage;
  final String date;
  final String imagePath;
  final bool seen;
  final Function onTap;

  const ConversationItem({
    Key key,
    @required this.title,
    @required this.lastMessage,
    @required this.date,
    this.imagePath: 'assets/images/9876 (6).png',
    @required this.onTap,
    this.seen: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_right,
                            color: Colors.grey,
                          ),
                          Text(
                            lastMessage,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  FontAwesomeIcons.angleDoubleRight,
                  color: Colors.grey,
                  size: 14,
                ),
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
                  color: Theme.of(context).accentColor,
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
