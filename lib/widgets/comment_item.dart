import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final String username;
  final String name;
  final String date;

  const CommentItem({
    Key key,
    @required this.text,
    this.imagePath: 'assets/my_images/9876 (6).png',
    @required this.username,
    @required this.name,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    imagePath,
                    width: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name),
                const SizedBox(height: 5),
                Text(username),
              ],
            ),
            Spacer(),
            Text(date),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Image.asset(
              'assets/my_images/comment (2).png',
              width: 30,
            ),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ],
    );
  }
}
