import 'package:flutter/material.dart';

import 'found_tab.dart';
import 'missing_tab.dart';

class MissingAndFoundTabsView extends StatelessWidget {
  const MissingAndFoundTabsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: TabBarView(
        children: <Widget>[
          MissingTab(),
          FoundTab(),
        ],
      ),
    );
  }
}
