import 'package:flutter/material.dart';

class MyBottomNavbar extends StatelessWidget {
  final Function onTap;
  final int currentIndex;

  const MyBottomNavbar({
    Key key,
    @required this.onTap,
    this.currentIndex: 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: make the button go to their screens
    final borderRadius = 40.0;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black38,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        color: Theme.of(context).accentColor,
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                onPressed: () => onTap(0),
                icon: Image.asset(
                  'assets/images/add-circular-outlined-button (1).png',
                  height: 25,
                ),
              ),
              Text(
                'إضافة',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                onPressed: () => onTap(1),
                icon: Image.asset(
                  'assets/images/home-run.png',
                  height: 25,
                ),
              ),
              Text(
                'الرئيسية',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                onPressed: () => onTap(2),
                icon: Image.asset(
                  'assets/images/envelope.png',
                  height: 25,
                ),
              ),
              Text(
                'الرسائل',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      // BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   backgroundColor: Theme.of(context).accentColor,
      //   onTap: onTap,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       title: const SizedBox(),
      //       icon: Image.asset(
      //         'assets/images/add-circular-outlined-button (1).png',
      //         height: 25,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: const SizedBox(),
      //       icon: Image.asset(
      //         'assets/images/home-run.png',
      //         height: 25,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: const SizedBox(),
      //       icon: Image.asset(
      //         'assets/images/envelope.png',
      //         height: 25,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
