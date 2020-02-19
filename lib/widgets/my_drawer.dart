import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (cxt, constraints) => Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            width: constraints.maxWidth * 0.6,
            height: 510,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/9876 (6).png',
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    color: Theme.of(context).accentColor,
                                    icon: Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'الأسم',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '@username',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DrawerButton(
                  iconPath: 'assets/images/add.png',
                  text: 'تعديل الملف الشخصى',
                  onTap: () => onTap(0),
                ),
                const SizedBox(height: 8),
                DrawerButton(
                  iconPath: 'assets/images/add-circular-outlined-button.png',
                  text: 'إضافة منشور',
                  onTap: () => onTap(1),
                ),
                const SizedBox(height: 8),
                DrawerButton(
                  iconPath: 'assets/images/star.png',
                  text: 'المفضلة',
                  onTap: () => onTap(2),
                ),
                const SizedBox(height: 8),
                DrawerButton(
                  iconPath: 'assets/images/help.png',
                  text: 'الدعم الفنى',
                  onTap: () => onTap(3),
                ),
                const SizedBox(height: 8),
                DrawerButton(
                  iconPath: 'assets/images/paper.png',
                  text: 'الشروط و الأحكام',
                  onTap: () => onTap(4),
                ),
                const SizedBox(height: 8),
                DrawerButton(
                  iconPath: 'assets/images/gear.png',
                  text: 'الإعدادات',
                  onTap: () => onTap(5),
                ),
                const Divider(
                  color: Colors.white,
                ),
                DrawerButton(
                  iconPath: 'assets/images/logout.png',
                  text: 'تسجيل الخروج',
                  onTap: () => onTap(6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function onTap;

  const DrawerButton({
    Key key,
    @required this.iconPath,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              iconPath,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
