import 'package:easy_localization/easy_localization_provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final data = EasyLocalizationProvider.of(context).data;
      data.changeLocale(Locale("ar", "SA"));
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, 'login-or-register');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo-1',
                    child: Image.asset(
                      'assets/my_images/logo.png',
                      // height: constraints.maxHeight * 0.4,
                      width: constraints.maxWidth * 0.4,
                    ),
                  ),
                  Hero(
                    tag: 'logo-2',
                    child: Image.asset(
                      'assets/my_images/iiii.png',
                      // height: constraints.maxHeight * 0.4,
                      width: constraints.maxWidth * 0.4,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
