import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raneem/styles.dart';
import 'package:raneem/widgets/my_bottom_navbar.dart';

import '../widgets/missing_and_found_tabs_view.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    args = args == null ? {} : args;
    final bool myProfile =
        args['myProfile'] == null ? false : args['myProfile'];
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 250,
                    backgroundColor: grey1,
                    titleSpacing: 15,
                    title: Row(
                      children: <Widget>[
                        Builder(
                          builder: (cxt) => IconButton(
                            icon: Image.asset('assets/images/list (1).png'),
                            onPressed: () => Scaffold.of(cxt).openDrawer(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Image.asset('assets/images/alarm (2).png'),
                          onPressed: () {},
                        ),
                        Spacer(),
                        SizedBox(
                          width: 60,
                          height: 40,
                          child: FlatButton(
                            padding: const EdgeInsets.all(0),
                            shape: CircleBorder(),
                            onPressed: () => Navigator.pop(context),
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
                                FontAwesomeIcons.arrowLeft,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            top: -80,
                            left: -50,
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 90,
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/9876 (6).png',
                                        width: 50,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('شهد'),
                                        const SizedBox(height: 5),
                                        Text('@shahd'),
                                      ],
                                    ),
                                    if (!myProfile) Spacer(),
                                    if (!myProfile)
                                      Image.asset(
                                        'assets/images/mail (1).png',
                                        width: 46,
                                      ),
                                    if (!myProfile) const SizedBox(width: 5),
                                    if (!myProfile)
                                      OutlineButton(
                                        highlightedBorderColor:
                                            Theme.of(context).accentColor,
                                        onPressed: () {},
                                        child: Text('أرسل رسالة'),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                          const SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              'الريض المملمة العربية السعودية',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/calendar.png',
                                            width: 30,
                                          ),
                                          const SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              'مولود فى 1995/5/5',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 1,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(bottom: 30),
                        ),
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                'المفقودات (12)',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.body1.color,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'تم العثور عليها (15)',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.body1.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        MissingAndFoundTabsView(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: MyBottomNavbar(
                  onTap: (index) {},
                  currentIndex: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
