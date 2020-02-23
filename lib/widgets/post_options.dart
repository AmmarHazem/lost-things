import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostOptions extends StatelessWidget {

  final Function onSharePressed;
  
  const PostOptions({
    Key key, @required this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
          child: IconButton(
            color: Colors.grey,
            padding: const EdgeInsets.all(0),
            icon: Icon(Icons.share),
            onPressed: onSharePressed,
          ),
        ),
        SizedBox(
          width: 30,
          child: IconButton(
            color: Colors.grey,
            padding: const EdgeInsets.all(0),
            icon: Icon(FontAwesomeIcons.envelope),
            onPressed: () {},
          ),
        ),
        IconButton(
          color: Colors.grey,
          padding: const EdgeInsets.all(0),
          icon: Icon(Icons.star),
          onPressed: () {},
        ),
        Text(
          'إضافة إلى المفضلة',
          style: Theme.of(context).textTheme.caption,
        ),
        Spacer(),
        Image.asset(
          'assets/my_images/calendar.png',
          width: 20,
        ),
        const SizedBox(width: 5),
        Text(
          '20/2/2012',
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
