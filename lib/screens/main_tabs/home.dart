import 'package:flutter/material.dart';

import '../../widgets/found_tab.dart';
import '../../widgets/missing_tab.dart';
import '../../widgets/categories_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: make this a CustomScrollView with SliverAppBar
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          CategoriesSlider(),
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'المفقودات',
                  style:
                      TextStyle(color: Theme.of(context).textTheme.body1.color),
                ),
              ),
              Tab(
                child: Text(
                  'تم العثور عليها',
                  style:
                      TextStyle(color: Theme.of(context).textTheme.body1.color),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                MissingTab(),
                FoundTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
