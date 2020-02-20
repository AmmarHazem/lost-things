import 'package:flutter/material.dart';

import 'widgets/my_alert_dialog.dart';
import 'widgets/share_dialog_content.dart';

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
