import 'package:flutter/material.dart';

class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/my_images/list (1).png'),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
