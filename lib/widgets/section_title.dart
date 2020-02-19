import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 15),
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
