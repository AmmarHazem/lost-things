import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';
import '../widgets/my_bottom_navbar.dart';
import '../styles.dart';
import '../utils.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = <Widget>[
      const SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          'assets/my_images/9876 (6).png',
          height: 50,
        ),
      ),
      FlatButton(
        child: Text(
          'تغير الصورة',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () {},
      ),
      const SizedBox(height: 30),
      Row(
        children: <Widget>[
          Image.asset(
            'assets/my_images/9876 (7).png',
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextFormField(
                decoration: textFieldDecoration.copyWith(
                  fillColor: Colors.grey[350],
                  hintText: 'شهد',
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      Row(
        children: <Widget>[
          Image.asset(
            'assets/my_images/9876 (7).png',
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextFormField(
                decoration: textFieldDecoration.copyWith(
                  fillColor: Colors.grey[350],
                  hintText: '@shahd',
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      Row(
        children: <Widget>[
          Image.asset(
            'assets/my_images/pin.png',
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextFormField(
                decoration: textFieldDecoration.copyWith(
                  fillColor: Colors.grey[350],
                  hintText: 'الرياض, المملكة العربية السعودية',
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      Row(
        children: <Widget>[
          Image.asset(
            'assets/my_images/9876 (1).png',
            height: 35,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: double.infinity,
              height: 48,
              color: Colors.grey[350],
              alignment: Alignment.centerRight,
              child: Text(
                'مولود فى 1996/9/9',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
    ];

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
        rightWidget: FlatButton(
          padding: const EdgeInsets.all(0),
          textColor: Colors.white,
          child: Text('حفظ'),
          onPressed: () {},
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        centerWidget: Text('تعديل الملف الشخصى'),
      ),
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            positionedCircle,
            Form(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: LiveList.options(
                      options: animatedListOptions,
                      // separatorBuilder: (cxt, index) =>
                      //     const SizedBox(height: 15),
                      itemBuilder: (cxt, index, animation) => buildAnimatedItem(
                        cxt,
                        index,
                        animation,
                        listItems[index],
                      ),
                      itemCount: listItems.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) => Navigator.pushNamedAndRemoveUntil(
          context,
          'main',
          (route) => false,
          arguments: {
            'tabIndex': index,
          },
        ),
      ),
    );
  }
}
