import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final textDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(10),
  fillColor: Colors.grey[300],
  filled: true,
  counterText: '',
  border: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0,
      color: Colors.grey[300],
    ),
    borderRadius: BorderRadius.circular(0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0,
      color: Colors.grey[300],
    ),
    borderRadius: BorderRadius.circular(0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0,
      color: Colors.grey[300],
    ),
    borderRadius: BorderRadius.circular(0),
  ),
);

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final bool sentToEmail = args['sentToEmail'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  Icon(
                    sentToEmail ? Icons.email : FontAwesomeIcons.mobileAlt,
                    size: 60,
                    color: Theme.of(context).accentColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'الرجاء إدخال كود التحقق المرسل إلى ',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    args['emailOrPhone'],
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                          maxLength: 1,
                          decoration: textDecoration,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: textDecoration,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                          maxLength: 1,
                          decoration: textDecoration,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                          maxLength: 1,
                          decoration: textDecoration,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 200,
                    child: FlatButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.check),
                          const SizedBox(width: 10),
                          Text('إرسال'),
                        ],
                      ),
                      onPressed: () => {},
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FlatButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'إعادة إرسال الرمز',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () => {},
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
