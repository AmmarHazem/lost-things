import 'package:flutter/material.dart';

import '../utils.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';
import '../widgets/report_found_page.dart';
import '../widgets/report_messing_page.dart';

import '../styles.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _pageController = PageController();
  var _reportMissing = true;

  @override
  Widget build(BuildContext context) {
    final animationDuration = Duration(milliseconds: 250);
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
        rightWidget: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          color: Theme.of(context).accentColor,
        ),
        centerWidget: Text('إضافة منشور'),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          positionedCircle,
          SafeArea(
            child: LayoutBuilder(
              builder: (cxt, constraints) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: SizedBox(
                    height: constraints.maxHeight * 1.6,
                    child: Column(
                      children: <Widget>[
                        Row(
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
                                        color:
                                            _reportMissing ? Colors.white : grey1,
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
                                        color:
                                            !_reportMissing ? Colors.white : grey1,
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
                        const SizedBox(height: 20),
                        Expanded(
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: <Widget>[
                              ReportMissingPage(),
                              ReportFoundPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) {},
        currentIndex: 1,
      ),
    );
  }
}
