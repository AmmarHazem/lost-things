import 'package:flutter/material.dart';

final grey1 = Color(0xFFF0F0F0);
final grey2 = Color(0xFFAAAAAA);
final grey3 = Color(0xFF7B7B7B);
final grey4 = Color(0xFF5F5F5F);

final textFieldDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 10,
  ),
  fillColor: Colors.grey[350],
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(
      color: Colors.grey[350],
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(
      color: Colors.grey[350],
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(
      color: Colors.grey[350],
    ),
  ),
);
