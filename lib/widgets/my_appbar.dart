import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget rightWidget;
  final Widget leftWidget;
  final Widget centerWidget;
  final Widget bottomWidget;

  const MyAppBar({
    Key key,
    @required this.height,
    @required this.rightWidget,
    @required this.leftWidget,
    this.centerWidget,
    this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    rightWidget,
                  ],
                ),
              ),
              if (centerWidget != null) centerWidget,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    leftWidget,
                  ],
                ),
              ),
            ],
          ),
          if (bottomWidget != null) bottomWidget,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
