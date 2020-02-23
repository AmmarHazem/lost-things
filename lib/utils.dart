import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'widgets/my_alert_dialog.dart';
import 'widgets/share_dialog_content.dart';

final animatedListOptions = LiveOptions(
  delay: Duration.zero,
  showItemDuration: Duration(milliseconds: 50),
  showItemInterval: Duration(milliseconds: 100),
  reAnimateOnVisibility: false,
);

Widget buildAnimatedItem(
  BuildContext context,
  int index,
  Animation<double> animation,
  Widget child,
) {
  final curevedAnimation = CurvedAnimation(
    curve: Curves.easeOutQuart,
    parent: animation,
  );
  return FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curevedAnimation),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 0.2),
        end: Offset.zero,
      ).animate(curevedAnimation),
      child: child,
    ),
  );
}

const KDrawerRoutesNames = <String>[
  'edit-profile',
  'add-post',
  'favourites',
  'tech-support',
  'terms-and-conditions',
  'settings',
];

void drawerOnTap(int index, int currentDrawerIndex, BuildContext context) {
  if (index == currentDrawerIndex) {
    Navigator.pop(context);
  } else {
    Navigator.pushReplacementNamed(context, KDrawerRoutesNames[index]);
  }
}

String truncateText(String text, [int length = 70]) {
  if (text.length <= length) {
    return text;
  }
  return text.substring(0, length) + '...';
}

void showShareDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (cxt) => MyAlertDialog(
      title: Text('مشاركة عبر'),
      content: ShareDialogContent(),
    ),
  );
}

// TODO: but this is all screens
final positionedCircle = Positioned(
  top: -165,
  left: -60,
  child: Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[300],
    ),
  ),
);
