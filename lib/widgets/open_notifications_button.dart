import 'package:flutter/material.dart';

class OpenNotificationsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/my_images/alarm (2).png'),
      onPressed: () => Navigator.pushNamed(context, 'notifications'),
    );
  }
}
