import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool centerTitle;

  const SectionTitle({
    Key key,
    @required this.title,
    this.centerTitle: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (!centerTitle) const SizedBox(width: 15),
        if (centerTitle)
          Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
          ),
        if (centerTitle) const SizedBox(width: 5),
        Text(title),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
