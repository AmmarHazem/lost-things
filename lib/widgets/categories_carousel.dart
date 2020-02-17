import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class CategoriesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageHeight = 50.0;
    final carousel = CarouselSlider(
      initialPage: 3,
      height: 110,
      enableInfiniteScroll: false,
      viewportFraction: 0.25,
      items: <Widget>[
        CategoriesSliderItem(
          icon: Image.asset(
            'assets/images/9876 (6).png',
            height: imageHeight,
          ),
          name: 'أغراض شخصية',
          onTap: () {},
        ),
        CategoriesSliderItem(
          icon: Image.asset(
            'assets/images/tv.png',
            height: imageHeight,
          ),
          name: 'إلكترونيات',
          onTap: () {},
        ),
        CategoriesSliderItem(
          icon: Image.asset(
            'assets/images/shirt.png',
            height: imageHeight,
          ),
          name: 'ملابس',
          onTap: () {},
        ),
        CategoriesSliderItem(
          icon: Image.asset(
            'assets/images/car.png',
            height: imageHeight,
          ),
          name: 'مواصلات',
          onTap: () {},
        ),
      ],
    );
    return Row(
      children: <Widget>[
        Expanded(
          child: carousel,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                carousel.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCirc,
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}

class CategoriesSliderItem extends StatelessWidget {
  final Widget icon;
  final String name;
  final Function onTap;

  const CategoriesSliderItem({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: onTap,
            child: icon,
            color: grey2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
