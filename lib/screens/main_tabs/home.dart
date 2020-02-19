import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../styles.dart';
import '../../widgets/missing_and_found_tabs_view.dart';
import '../../widgets/categories_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: LayoutBuilder(
        builder: (cxt, constraints) => CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 310,
              backgroundColor: grey1,
              titleSpacing: 15,
              title: Row(
                children: <Widget>[
                  const SizedBox(width: 10),
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
                      onPressed: () {},
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
                          FontAwesomeIcons.userAlt,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: <Widget>[
                      LayoutBuilder(
                        builder: (cxt, constraints) => Column(
                          children: <Widget>[
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: constraints.maxWidth * 0.7,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/search (1).png',
                                      width: 30,
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'بحث',
                                      style: TextStyle(color: Colors.grey[400]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CategoriesSlider(),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              'المفقودات',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.body1.color),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'تم العثور عليها',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.body1.color),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: constraints.maxHeight,
                child: MissingAndFoundTabsView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
