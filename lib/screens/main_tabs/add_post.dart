import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../../utils.dart';
import '../../widgets/my_appbar.dart';
import '../../widgets/report_found_page.dart';
import '../../widgets/report_messing_page.dart';
import '../../styles.dart';

class AddPostTab extends StatefulWidget {
  final Function goBack;

  const AddPostTab({
    Key key,
    @required this.goBack,
  }) : super(key: key);

  @override
  _AddPostTabState createState() => _AddPostTabState();
}

class _AddPostTabState extends State<AddPostTab> {
  final _pageController = PageController();
  var _reportMissing = true;

  @override
  Widget build(BuildContext context) {
    final animationDuration = Duration(milliseconds: 250);
    final listViewItems = <Widget>[
      MyAppBar(
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
            onPressed: widget.goBack,
          ),
        ),
        rightWidget: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(Icons.close),
          onPressed: widget.goBack,
          color: Theme.of(context).accentColor,
        ),
        centerWidget: Text('إضافة منشور'),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  if (!_reportMissing) {
                    setState(() {
                      _reportMissing = !_reportMissing;
                    });
                    _pageController.animateToPage(
                      0,
                      duration: animationDuration,
                      curve: Curves.easeInOutCirc,
                    );
                  }
                },
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  duration: animationDuration,
                  decoration: BoxDecoration(
                    color: _reportMissing
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    border: _reportMissing
                        ? Border(
                            right: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 3,
                            ),
                          )
                        : Border(
                            right: BorderSide(
                              color: grey1,
                              width: 3,
                            ),
                          ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: _reportMissing ? Colors.white : grey1,
                      ),
                      Text(
                        'إبلاغ عن مفقود',
                        style: TextStyle(
                          color: _reportMissing
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (_reportMissing) {
                    setState(() {
                      _reportMissing = !_reportMissing;
                    });
                    _pageController.animateToPage(
                      1,
                      duration: animationDuration,
                      curve: Curves.easeInOutCirc,
                    );
                  }
                },
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  duration: animationDuration,
                  decoration: BoxDecoration(
                    color: !_reportMissing
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    border: !_reportMissing
                        ? Border(
                            left: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 3,
                            ),
                          )
                        : Border(
                            left: BorderSide(
                              color: Colors.transparent,
                              width: 3,
                            ),
                          ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: !_reportMissing ? Colors.white : grey1,
                      ),
                      Text(
                        'إعلان عن موجود',
                        style: TextStyle(
                          color: !_reportMissing
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Container(
        height: 700,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            ReportMissingPage(),
            ReportFoundPage(),
          ],
        ),
      ),
    ];
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: -80,
          left: -60,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: LiveList.options(
                options: animatedListOptions,
                separatorBuilder: (cxt, index) => const SizedBox(height: 15),
                itemBuilder: (cxt, index, animation) => buildAnimatedItem(
                  cxt,
                  index,
                  animation,
                  listViewItems[index],
                ),
                itemCount: listViewItems.length,
                padding: const EdgeInsets.only(top: 15, bottom: 80),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
