import 'package:flutter/material.dart';

import 'categories_carousel.dart';

class ShareDialogContent extends StatelessWidget {
  const ShareDialogContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/instagram.png'),
                  name: 'إنستاجران',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/facebook.png'),
                  name: 'فيسبوك',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/snapchat.png'),
                  name: 'سناب شات',
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/whatsapp.png'),
                  name: 'واتساب',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/twitter.png'),
                  name: 'تويتر',
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CategoriesSliderItem(
                  icon: Image.asset('assets/my_images/chain.png'),
                  name: 'نسخ الرابط',
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
