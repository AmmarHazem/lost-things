import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _enterEmail = true;
  bool _showEmalPhoneNumberToggleBtn = true;
  final _emailOrPhoneNumber = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailOrPhoneNumber.addListener(_focusNodeListener);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _focusNodeListener() {
    if (_emailOrPhoneNumber.hasFocus) {
      setState(() {
        _showEmalPhoneNumberToggleBtn = false;
      });
    } else {
      _showEmalPhoneNumberToggleBtn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.08,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.bottomRight,
                        image: AssetImage('assets/images/search.png'),
                      ),
                    ),
                    alignment: Alignment.center,
                    height: constraints.maxHeight * 0.4,
                    width: double.infinity,
                    child: Text(
                      'الأشتراك',
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'أسم المستخدم',
                      labelStyle: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      labelStyle: TextStyle(color: Colors.white),
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
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'تأكيد كلمة المرور',
                      labelStyle: TextStyle(color: Colors.white),
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
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: _enterEmail ? TextInputType.emailAddress : TextInputType.number,
                        focusNode: _emailOrPhoneNumber,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText:
                              _enterEmail ? 'البريد الإلكترونى' : 'رقم الجوال',
                          labelStyle: TextStyle(color: Colors.white),
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
                      if (_showEmalPhoneNumberToggleBtn)
                        Positioned(
                          left: 30,
                          top: 0,
                          bottom: 0,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'أو ',
                                style: TextStyle(color: Colors.white),
                              ),
                              FlatButton(
                                padding: const EdgeInsets.all(0),
                                textColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _enterEmail = !_enterEmail;
                                  });
                                },
                                child: Text(
                                  _enterEmail
                                      ? 'رقم الجوال'
                                      : 'البريد الإلكترونى',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Text('تسجيل الدخول'),
                      onPressed: () {},
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
                        'لديك حساب بالفعل ؟ ',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white),
                      ),
                      FlatButton(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          'قم بتسجيل الدخول الان',
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
          ),
        ),
      ),
    );
  }
}
