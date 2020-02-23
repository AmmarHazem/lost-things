import 'package:flutter/material.dart';

import '../widgets/my_bottom_navbar.dart';
import 'main_tabs/add_post.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: AddPostTab(goBack: () => Navigator.pop(context)),
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) {},
        currentIndex: 1,
      ),
    );
  }
}
