import 'package:flutter/material.dart';
import 'package:raneem/widgets/my_alert_dialog.dart';
import 'package:raneem/widgets/report_messing_page.dart';

import '../styles.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_appbar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _selectedType;
  DateTime _selectedTime;

  void _setSelectedType(String value) {
    setState(() {
      _selectedType = value;
    });
  }

  void _showPickTypeDialog() {
    showDialog(
      context: context,
      builder: (cxt) => MyAlertDialog(
        content: SelectTypeDialogContent(onSelectType: _setSelectedType),
        title: Text(
          'أختر نوع',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }

  void _showDateTimePicker(BuildContext cxt) async {
    final selectedTime = await showDatePicker(
      context: cxt,
      initialDate: DateTime(2020),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomOffset = 40.0;
    final leftOffset = 20.0;
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-15, -5),
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Text(
                        'أبحث عن ماتريد',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/right-arrow (1).png',
                      width: 30,
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: _showPickTypeDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(_selectedType == null
                                ? 'النوع'
                                : _selectedType),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Theme(
                      data: Theme.of(context).copyWith(
                          primaryColor: Theme.of(context).accentColor,
                          accentColor: Theme.of(context).primaryColor,
                          textTheme: Theme.of(context).textTheme.copyWith(
                                button: TextStyle(color: Colors.white),
                              )),
                      child: Builder(
                        builder: (cxt) => InkWell(
                          onTap: () => _showDateTimePicker(cxt),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _selectedTime == null
                                      ? 'المدة الزمنية'
                                      : _selectedTime.toIso8601String(),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Text('المكان'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      maxLength: 20,
                      decoration: textFieldDecoration.copyWith(
                        counterText: '',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Text('الموقع'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      maxLength: 20,
                      decoration: textFieldDecoration.copyWith(
                        counterText: '',
                      ),
                    ),
                    const SizedBox(height: 100),
                    FlatButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      child: Text('أبحث'),
                      onPressed: () => Navigator.pushNamed(context, 'search-result'),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: bottomOffset,
                left: leftOffset,
                child: Image.asset(
                  'assets/images/kkjhbgv.png',
                  height: 150,
                ),
              ),
              Positioned(
                bottom: bottomOffset,
                left: leftOffset,
                child: Image.asset(
                  'assets/images/uuuuuuuuuuuuuu.png',
                  height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
        onTap: (index) {},
        currentIndex: 1,
      ),
    );
  }
}