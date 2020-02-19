import 'package:flutter/material.dart';

import 'missing_item.dart';

class MissingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      MissingItem(
        onTap: () => Navigator.pushNamed(
          context,
          'missing-post-details',
          arguments: {
            'imagePath': 'assets/images/pexels-photo-583847.jpeg',
          },
        ),
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-583847.jpeg',
        name: 'هاتف محمول',
      ),
      const SizedBox(height: 15),
      MissingItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-1031460j.jpeg',
        name: 'هاتف محمول',
      ),
      const SizedBox(height: 15),
      MissingItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-1162519.jpeg',
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
    // return ListView.separated(
    //   separatorBuilder: (cxt, index) => const SizedBox(height: 15),
    //   itemBuilder: (cxt, index) => listViewItems[index],
    //   itemCount: listViewItems.length,
    //   padding: const EdgeInsets.only(
    //     left: 15,
    //     right: 15,
    //     top: 15,
    //     bottom: 85,
    //   ),
    // );
  }
}
