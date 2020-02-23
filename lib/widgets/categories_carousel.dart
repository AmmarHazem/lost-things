import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageHeight = 50.0;
    final List items = <Widget>[
      CategoriesSliderItem(
        icon: Image.asset(
          'assets/my_images/9876 (6).png',
          height: imageHeight,
        ),
        name: 'أغراض شخصية',
        onTap: () {},
      ),
      CategoriesSliderItem(
        icon: Image.asset(
          'assets/my_images/tv.png',
          height: imageHeight,
        ),
        name: 'إلكترونيات',
        onTap: () {},
      ),
      CategoriesSliderItem(
        icon: Image.asset(
          'assets/my_images/shirt.png',
          height: imageHeight,
        ),
        name: 'ملابس',
        onTap: () {},
      ),
      CategoriesSliderItem(
        icon: Image.asset(
          'assets/my_images/car.png',
          height: imageHeight,
        ),
        name: 'مواصلات',
        onTap: () {},
      ),
      CategoriesSliderItem(
        icon: Image.asset(
          'assets/my_images/tv.png',
          height: imageHeight,
        ),
        name: 'إلكترونيات',
        onTap: () {},
      ),
    ];
    final carousel = CarouselSlider(
      initialPage: 3,
      height: 110,
      enableInfiniteScroll: true,
      viewportFraction: 0.25,
      items: items,
    );
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                carousel.animateToPage(
                  items.length - 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCirc,
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
        Expanded(
          child: carousel,
        ),
      ],
    );
  }
}

class CategoriesSliderItem extends StatelessWidget {
  final Widget icon;
  final String name;
  final Function onTap;
  final double horizontalMargin;

  const CategoriesSliderItem({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.onTap,
    this.horizontalMargin: 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 80,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: FlatButton(
                onPressed: onTap,
                child: icon,
                color: Colors.grey[350],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
              ),
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
