import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Hero(
                    tag: 'logo-1',
                    child: Image.asset(
                      'assets/my_images/logo.png',
                      // height: constraints.maxHeight * 0.4,
                      width: constraints.maxWidth * 0.25,
                    ),
                  ),
                  Hero(
                    tag: 'logo-2',
                    child: Image.asset(
                      'assets/my_images/iiii.png',
                      // height: constraints.maxHeight * 0.4,
                      width: constraints.maxWidth * 0.25,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: FlatButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('الأشتراك'),
                      onPressed: () => Navigator.pushNamed(context, 'register'),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textColor: Colors.white,
                      child: Text('تسجيل الدخول'),
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/my_images/1.PNG',
                    height: constraints.maxHeight * 0.3,
                  ),
                  Text('جميع الحقوق محفوظة 2020'),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
