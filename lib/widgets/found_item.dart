import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils.dart';

class FoundItem extends StatelessWidget {
  final String name;
  final String description;
  final String date;
  final bool isFavorite;
  final int commentsCount;
  final Function onTap;

  const FoundItem({
    Key key,
    @required this.name,
    @required this.description,
    @required this.date,
    @required this.commentsCount,
    this.isFavorite: false,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: Container(
          color: Colors.white,
          width: double.infinity,
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
                      height: 30,
                      width: 30,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Image.asset(
                          'assets/my_images/tack.png',
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Text(truncateText(
                  description,
                  45,
                )),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/my_images/calendar.png',
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
                    Text('($commentsCount)')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
