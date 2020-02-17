import 'package:flutter/material.dart';

import '../../widgets/missing_item.dart';
import '../../widgets/categories_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                FoundTab(),
                MissingTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoundTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      
    );
  }
}

class MissingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      MissingItem(
        commentsCount: 12,
        date: '1441/9/6',
        description: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-583847.jpeg',
        name: 'هاتف محمول',
      ),
    ];
    return ListView.builder(
      itemBuilder: (cxt, index) => listViewItems[index],
    );
  }
}
