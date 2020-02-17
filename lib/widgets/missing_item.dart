import 'package:flutter/material.dart';

import '../utils.dart';

class MissingItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String date;
  final bool isFavorite;
  final int commentsCount;

  const MissingItem({
    Key key,
    @required this.imagePath,
    @required this.name,
    @required this.description,
    @required this.date,
    @required this.commentsCount,
    this.isFavorite: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(child: Image.asset(imagePath)),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/tack.png'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(truncateText(
                    description,
                    20,
                  )),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/images/calendar.png'),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
