import 'package:flutter/material.dart';

import '../widgets/drawer_button.dart';
import '../widgets/my_alert_dialog.dart';
import '../widgets/my_drawer.dart';
import '../widgets/open_notifications_button.dart';
import '../widgets/section_title.dart';
import '../utils.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';

class BlockedAccounts extends StatelessWidget {
  void _showRemoveBlockDialog(String username, BuildContext context) {
    showDialog(
      context: context,
      builder: (cxt) => MyAlertDialog(
        title: const SizedBox(),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'هل تريد إلغاء الحظر عن $username ؟',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text('نعم'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: OutlineButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  onPressed: () => Navigator.pop(context),
                  child: Text('لا'),
                  textColor: Theme.of(context).primaryColor,
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
      ),
      BlockedAccount(
        onTap: () => Navigator.pushNamed(context, 'profile'),
        name: 'شهد',
        onBlockedPressed: () => _showRemoveBlockDialog('@shahd', context),
        username: '@shahd',
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
        centerWidget: Text('الحسابات المحظورة'),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          positionedCircle,
          SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                SectionTitle(title: '(10) عدد الحسابات المحظورة'),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (cxt, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (cxt, index) => listItems[index],
                    itemCount: listItems.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 15,
                    ),
                  ),
                ),
              ],
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

class BlockedAccount extends StatelessWidget {
  final String name;
  final String username;
  final String imagePath;
  final Function onBlockedPressed;
  final Function onTap;

  const BlockedAccount({
    Key key,
    this.imagePath: 'assets/my_images/9876 (6).png',
    @required this.name,
    @required this.username,
    @required this.onBlockedPressed,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                imagePath,
                width: 30,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name),
                Text(username),
              ],
            ),
            Spacer(),
            FlatButton(
              child: Text('محظور'),
              color: Theme.of(context).accentColor,
              onPressed: onBlockedPressed,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
