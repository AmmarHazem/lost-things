import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

import './screens/missing_post_details.dart';
import './screens/profile.dart';
import './screens/blocked_accounts.dart';
import './screens/terms_and_conditions.dart';
import './screens/technical_support.dart';
import './screens/add_post.dart';
import './screens/favourits.dart';
import './screens/edit_profile.dart';
import './screens/main_screen.dart';
import './screens/register.dart';
import './screens/verification_code.dart';
import './screens/login.dart';
import './screens/login_or_register.dart';
import './screens/splash.dart';
import 'screens/settings.dart';
import 'styles.dart';

void main() => runApp(EasyLocalization(child: Raneem()));

class Raneem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primarColor = Color(0xFF1C335F);
    final accentColor = Color(0xFFE49548);
    final data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'رنيم',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalizationDelegate(
            locale: data.locale,
            path: 'assets/languages',
          ),
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        locale: data.locale,
        theme: ThemeData(
          // canvasColor: Colors.transparent,
          textTheme: TextTheme(
            headline: TextStyle(color: primarColor),
          ),
          fontFamily: 'MainFont',
          primaryColor: primarColor,
          accentColor: accentColor,
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: grey1,
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (cxt) => SplashScreen(),
          'login-or-register': (cxt) => LoginOrRegister(),
          'login': (cxt) => Login(),
          'register': (cxt) => Register(),
          'verification-code': (cxt) => VerificationCode(),
          'main': (cxt) => MainScreen(),
          'edit-profile': (cxt) => EditProfile(),
          'add-post': (cxt) => AddPost(),
          'favourites': (cxt) => Favourites(),
          'tech-support': (cxt) => TechnicalSupport(),
          'terms-and-conditions': (cxt) => TermsAndConditions(),
          'settings': (cxt) => Settings(),
          'blocked-accounts': (cxt) => BlockedAccounts(),
          'profile': (cxt) => Profile(),
          'missing-post-details': (cxt) => MissingPotDetails(),
        },
      ),
    );
  }
}
