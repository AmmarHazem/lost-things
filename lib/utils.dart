import 'package:flutter/material.dart';

String truncateText(String text, [int length = 70]) {
  if (text.length <= length) {
    return text;
  }
  return text.substring(0, length) + '...';
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
