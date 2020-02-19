import 'package:flutter/material.dart';

import 'found_item.dart';

class FoundTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      FoundItem(
        onTap: () => Navigator.pushNamed(context, 'found-post-details'),
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
      const SizedBox(height: 15),
      FoundItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
      const SizedBox(height: 15),
      FoundItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        name: 'هاتف محمول',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Column(
        children: listViewItems,
      ),
    );
  }
}
