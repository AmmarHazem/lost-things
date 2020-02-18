import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils.dart';

class MissingItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String date;
  final bool isFavorite;
  final int commentsCount;
  final Function onTap;

  const MissingItem({
    Key key,
    @required this.imagePath,
    @required this.name,
    @required this.description,
    @required this.date,
    @required this.commentsCount,
    this.isFavorite: false,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 7,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          name,
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          height: 25,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Image.asset(
                              'assets/images/tack.png',
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Text(truncateText(
                      description,
                      28,
                    )),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/calendar.png',
                          width: 25,
                        ),
                        const SizedBox(width: 5),
                        Text(date),
                        Spacer(),
                        SizedBox(
                          width: 30,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(Icons.star),
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Icon(FontAwesomeIcons.commentDots),
                          onPressed: () {},
                        ),
                        Text('($commentsCount)'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
