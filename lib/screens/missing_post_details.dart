import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/comment_item.dart';
import '../widgets/section_title.dart';
import '../widgets/my_appbar.dart';

class MissingPotDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final String imagePath = args['imagePath'];
    final horizontalPadding = const EdgeInsets.symmetric(horizontal: 15);
    final List<Widget> listItems = [
      MissingItemSlider(imagePath: [
        imagePath,
        'assets/images/pexels-photo-1031460j.jpeg',
        'assets/images/pexels-photo-1162519.jpeg',
      ]),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
              child: IconButton(
                color: Colors.grey,
                padding: const EdgeInsets.all(0),
                icon: Icon(Icons.share),
                onPressed: () {},
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
              'assets/images/calendar.png',
              width: 20,
            ),
            const SizedBox(width: 5),
            Text(
              '20/2/2012',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/9876 (6).png',
                width: 30,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ياسر',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '@yaser',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: horizontalPadding,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(width: 5),
            Text('هاتف محمول'),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: horizontalPadding,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                  'ضاع منى جوالى بالحديقة العامة بالرياض أرجو من يعثر علية التواصل معى'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: horizontalPadding,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).accentColor,
            ),
            const SizedBox(width: 5),
            FlatButton(
              child: Text(
                'الرياض المملكة العربية السعودية',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      SectionTitle(title: 'التعليقات (13)'),
      const SizedBox(height: 20),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
      Container(
        height: 1,
        color: Colors.grey,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
      Container(
        height: 1,
        color: Colors.grey,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
      ),
      Padding(
        padding: horizontalPadding,
        child: CommentItem(
          date: 'منذ 11 دقيقة',
          name: 'شهد',
          text: '1234567890',
          username: '@shahd',
        ),
      ),
    ];
    return Scaffold(
      appBar: MyAppBar(
        height: 50,
        leftWidget: SizedBox(
          width: 40,
          child: FlatButton(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        rightWidget: Row(
          children: <Widget>[
            const SizedBox(width: 10),
            Builder(
              builder: (cxt) => IconButton(
                icon: Image.asset('assets/images/list (1).png'),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Image.asset('assets/images/alarm (2).png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (cxt, index) => listItems[index],
          itemCount: listItems.length,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }
}

class MissingItemSlider extends StatefulWidget {
  const MissingItemSlider({
    Key key,
    @required this.imagePath,
  }) : super(key: key);

  final List<String> imagePath;

  @override
  _MissingItemSliderState createState() => _MissingItemSliderState();
}

class _MissingItemSliderState extends State<MissingItemSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        CarouselSlider(
          onPageChanged: (index) => setState(() => _currentIndex = index),
          height: 300,
          viewportFraction: 1.0,
          items: widget.imagePath
              .map<Widget>(
                (path) => Image.asset(
                  path,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        Positioned(
          top: -17,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Text(
                  'مفقود',
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imagePath.length, (index) {
              final child = AnimatedContainer(
                duration: Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex
                      ? Theme.of(context).accentColor
                      : Colors.white,
                ),
              );
              if (index == 0) {
                return Hero(
                  tag: 'missing-item-image-${widget.imagePath[index]}',
                  child: child,
                );
              }
              return child;
            }),
          ),
        ),
      ],
    );
  }
}
