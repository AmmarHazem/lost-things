import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styles.dart';

class Login extends StatelessWidget {
  // void _showForgotPasswordDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (cxt) => ForgotPasswordModal(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * 0.08,
                right: constraints.maxWidth * 0.08,
              ),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.bottomRight,
                          image: AssetImage('assets/my_images/search (2).png'),
                        ),
                      ),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.4,
                      width: double.infinity,
                      child: Text(
                        'تسجيل الدخول',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'أسم المستخدم',
                              labelStyle: TextStyle(color: grey4),
                              prefixIcon: Icon(
                                FontAwesomeIcons.userAlt,
                                color: Theme.of(context).accentColor,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'كلمة المرور',
                              labelStyle: TextStyle(color: grey4),
                              prefixIcon: Icon(
                                FontAwesomeIcons.key,
                                color: Theme.of(context).accentColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                padding: const EdgeInsets.all(0),
                                child: Text('هل نسيت كلمة المرور ؟'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: FlatButton(
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 30,
                              ),
                              child: Text('تسجيل الدخول'),
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'main'),
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'ليس لديك حساب ؟',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              FlatButton(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  'قم بالأشتراك الان',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () =>
                                    Navigator.pushNamed(context, 'register'),
                              ),
                            ],
                          ),
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
    );
  }
}

class ForgotPasswordModal extends StatefulWidget {
  @override
  _ForgotPasswordModalState createState() => _ForgotPasswordModalState();
}

class _ForgotPasswordModalState extends State<ForgotPasswordModal> {
  final _textFieldController = TextEditingController();
  var _enterEmail = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_enterEmail ? 'أدخل البريد الإلكترونى' : 'أدخل رقم الجوال'),
      content: LayoutBuilder(
        builder: (cxt, constraints) => SizedBox(
          height: constraints.maxHeight * 0.9,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _textFieldController,
                keyboardType: _enterEmail
                    ? TextInputType.emailAddress
                    : TextInputType.number,
                decoration: InputDecoration(
                  labelText: _enterEmail ? 'البريد الإلكترونى' : 'رقم الجوال',
                  labelStyle: TextStyle(color: grey4),
                  prefixIcon: Icon(
                    _enterEmail ? Icons.email : FontAwesomeIcons.mobile,
                    color: Theme.of(context).accentColor,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FlatButton(
                child: Text(
                    _enterEmail ? 'أو رقم الجوال' : 'أو البريد الإلكترونى'),
                onPressed: () => setState(() => _enterEmail = !_enterEmail),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Text('إرسال الكود'),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    'verification-code',
                    arguments: {
                      'sentToEmail': _enterEmail,
                      'emailOrPhone': _textFieldController.text,
                    },
                  ),
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
