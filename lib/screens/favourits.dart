import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';
import '../widgets/found_item.dart';
import '../widgets/missing_item.dart';
import '../widgets/my_appbar.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listViewItems = [
      MissingItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-583847.jpeg',
        name: 'هاتف محمول',
      ),
      MissingItem(
        onTap: () {},
        commentsCount: 12,
        date: '1441/9/6',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
        imagePath: 'assets/images/pexels-photo-1031460j.jpeg',
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
    return Scaffold(
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
            Builder(
              builder: (cxt) => IconButton(
                icon: Image.asset('assets/images/list (1).png'),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Image.asset('assets/images/alarm (2).png'),
              onPressed: () {},
            ),
          ],
        ),
        centerWidget: Text('المفضلة'),
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (cxt, index) => const SizedBox(height: 15),
          itemBuilder: (cxt, index) => listViewItems[index],
          itemCount: listViewItems.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
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
