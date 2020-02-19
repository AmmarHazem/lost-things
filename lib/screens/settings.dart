import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raneem/widgets/my_alert_dialog.dart';

import '../styles.dart';
import '../widgets/section_title.dart';
import '../utils.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _showChangeEmailDialog() {
    showDialog(
      context: context,
      builder: (cxt) => MyAlertDialog(
        title: Image.asset(
          'assets/images/mail.png',
          width: 30,
        ),
        content: EditEmailDialogContent(),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (cxt) => MyAlertDialog(
        title: Image.asset(
          'assets/images/lock (1).png',
          width: 30,
        ),
        content: EditPasswordDialogContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        centerWidget: Text('الإعدادات'),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          positionedCircle,
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  SectionTitle(title: 'حسابى'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text('البريد الإلكترونى'),
                              const SizedBox(width: 20),
                              Text('username@emial.com'),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                'تغير',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: _showChangeEmailDialog,
                              padding: const EdgeInsets.all(0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text('كلمة المرور'),
                              const SizedBox(width: 20),
                              Text('* * * * * *'),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text(
                                'تغير',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: _showChangePasswordDialog,
                              padding: const EdgeInsets.all(0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SectionTitle(title: 'التنبيهات'),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('التنبيهات'),
                        Switch(
                          onChanged: (value) {},
                          value: true,
                          activeColor: Theme.of(context).primaryColor,
                          activeTrackColor: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => Navigator.pushNamed(context, 'blocked-accounts'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'الحسابات المحظورة',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SectionTitle(title: 'الموقع'),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('الموقع'),
                        Switch(
                          onChanged: (value) {},
                          value: true,
                          activeColor: Theme.of(context).primaryColor,
                          activeTrackColor: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SectionTitle(title: 'اللغة'),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: 'العربية',
                      items: [
                        DropdownMenuItem<String>(
                          value: 'العربية',
                          child: Text(
                            'العربية',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'english',
                          child: Text(
                            'English',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      isExpanded: true,
                      icon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
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

class EditPasswordDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'كلمة المرور الحالية',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 30),
            Text(
              'كلمة المرور الجديدة',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 30),
            Text(
              'تأكيد كلمة المرور الجديدة',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'تغير',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class EditEmailDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'البريد الإلكترونى الحالى',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 30),
            Text(
              'البريد الإلكترونى الجديد',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'التحقق',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
