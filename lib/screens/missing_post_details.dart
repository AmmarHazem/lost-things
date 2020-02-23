import 'package:auto_animated/auto_animated.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/open_notifications_button.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/post_options.dart';
import '../widgets/comment_item.dart';
import '../widgets/section_title.dart';
import '../widgets/my_appbar.dart';
import '../utils.dart';

class MissingPotDetails extends StatefulWidget {
  @override
  _MissingPotDetailsState createState() => _MissingPotDetailsState();
}

class _MissingPotDetailsState extends State<MissingPotDetails> {
  int _selectedDrawerIndex = 0;
  List<Widget> _drawers;

  @override
  void initState() {
    super.initState();

    _drawers = [
      MyDrawer(
        onTap: (index) => drawerOnTap(index, -1, context),
      ),
      DeletePostDrawer(),
    ];
  }

  void _openDrawer(int index, BuildContext cxt) {
    if (_selectedDrawerIndex != index) {
      setState(() {
        _selectedDrawerIndex = index;
      });
    }
    Scaffold.of(cxt).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final String imagePath = args['imagePath'];
    final horizontalPadding = const EdgeInsets.symmetric(horizontal: 15);
    final List<Widget> listItems = [
      MissingItemSlider(
        imagePath: [
          imagePath,
          'assets/images/pexels-photo-1031460j.jpeg',
          'assets/images/pexels-photo-1162519.jpeg',
        ],
        openDrawer: _openDrawer,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PostOptions(onSharePressed: () => showShareDialog(context)),
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
      drawerEdgeDragWidth: 0,
      bottomNavigationBar: MyBottomNavbar(onTap: (index) {}),
      drawer: _drawers[_selectedDrawerIndex],
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
                onPressed: () => _openDrawer(0, cxt),
              ),
            ),
            OpenNotificationsButton(),
          ],
        ),
      ),
      body: SafeArea(
        child: LiveList.options(
          options: animatedListOptions,
          separatorBuilder: (cxt, index) => const SizedBox(height: 15),
          itemBuilder: (cxt, index, animation) => buildAnimatedItem(
            cxt,
            index,
            animation,
            listItems[index],
          ),
          itemCount: listItems.length,
          padding: const EdgeInsets.only(top: 25, bottom: 15),
        ),
      ),
    );
  }
}

class DeletePostDrawer extends StatelessWidget {
  const DeletePostDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (cxt, constraints) => Column(
        children: <Widget>[
          SizedBox(height: constraints.maxHeight * 0.2),
          SizedBox(
            width: constraints.maxWidth * 0.75,
            child: FlatButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/trash.png',
                    width: 30,
                  ),
                  const SizedBox(width: 10),
                  Text('حذف المنشور'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MissingItemSlider extends StatefulWidget {
  const MissingItemSlider({
    Key key,
    @required this.imagePath,
    @required this.openDrawer,
  }) : super(key: key);

  final List<String> imagePath;
  final Function openDrawer;

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
          top: 0,
          right: 0,
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.more_vert),
            onPressed: () => widget.openDrawer(1, context),
            color: Theme.of(context).accentColor,
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
