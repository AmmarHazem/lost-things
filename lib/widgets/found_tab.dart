import 'package:flutter/material.dart';

import 'found_item.dart';

class FoundTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      FoundItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
      FoundItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
      FoundItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
    ];
    return ListView.separated(
      separatorBuilder: (cxt, index) => const SizedBox(height: 15),
      itemBuilder: (cxt, index) => listViewItems[index],
      itemCount: listViewItems.length,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 85,
      ),
    );
  }
}
