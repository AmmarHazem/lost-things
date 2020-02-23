import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final Widget title;
  final Widget content;

  const MyAlertDialog({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(width: 40),
          title,
          IconButton(
            icon: Image.asset(
              'assets/my_images/cross.png',
              width: 15,
            ), // Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
      content: content,
    );
  }
}
