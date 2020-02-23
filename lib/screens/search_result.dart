import 'package:flutter/material.dart';

import '../widgets/open_notifications_button.dart';
import '../widgets/my_drawer.dart';
import '../utils.dart';
import '../widgets/drawer_button.dart';
import '../widgets/missing_and_found_tabs_view.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        centerWidget: Text('نتائج البحث'),
      ),
      body: SafeArea(
        // child: ListView.builder(
        //   itemBuilder: (cxt, index) => listViewItem[index],
        //   itemCount: listViewItem.length,
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 15,
        //     vertical: 15,
        //   ),
        // ),
        child: DefaultTabController(
          length: 2,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/search (1).png',
                        width: 30,
                      ),
                      SearchQuery(
                        onCloseTab: () {},
                        text: 'مواصلات',
                      ),
                      SearchQuery(
                        onCloseTab: () {},
                        text: '1441/2/5',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'المفقودات',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'تم العثور عليها',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MissingAndFoundTabsView(),
              ],
            ),
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

class SearchQuery extends StatelessWidget {
  final String text;
  final Function onCloseTab;

  const SearchQuery({
    Key key,
    @required this.text,
    @required this.onCloseTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(
            height: 40,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onCloseTab,
              icon: Icon(
                Icons.close,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
