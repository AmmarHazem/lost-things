import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isSent;
  final String text;
  final String imagePath;
  final String date;

  const Message({
    Key key,
    this.isSent: true,
    @required this.text,
    @required this.imagePath,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = 20.0;
    final userImage = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSent
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        imagePath,
        height: 30,
      ),
    );
    return LayoutBuilder(
      builder: (cxt, constraints) => Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          if (isSent) userImage,
          if (isSent) const SizedBox(width: 5),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.5),
                  decoration: BoxDecoration(
                    color: isSent
                        ? Theme.of(context).accentColor
                        : Colors.grey[350],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                      bottomLeft: isSent
                          ? Radius.circular(borderRadius)
                          : Radius.circular(0),
                      bottomRight: !isSent
                          ? Radius.circular(borderRadius)
                          : Radius.circular(0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text(
                    text,
                    style:
                        TextStyle(color: isSent ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          if (!isSent) const SizedBox(width: 5),
          if (!isSent) userImage,
        ],
      ),
    );
  }
}
