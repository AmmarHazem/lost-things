import 'package:flutter/material.dart';

import 'report_messing_page.dart';
import '../styles.dart';
import 'my_alert_dialog.dart';

class ReportFoundPage extends StatefulWidget {
  @override
  _ReportFoundPageState createState() => _ReportFoundPageState();
}

class _ReportFoundPageState extends State<ReportFoundPage> {
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType;

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

  void _setSelectedType(String value) {
    setState(() {
      _selectedType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('العنوان'),
          const SizedBox(height: 10),
          TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: _addressController,
            maxLength: 20,
            decoration: textFieldDecoration.copyWith(
              counterText: '',
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/comment (2).png',
                    width: 30,
                  ),
                ],
              ),
              hintText: 'أكتب...',
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_addressController.text.length}/20',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('الوصف'),
          const SizedBox(height: 10),
          TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: _descriptionController,
            maxLength: 300,
            maxLines: 10,
            decoration: textFieldDecoration.copyWith(
              counterText: '',
              prefixIcon: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    // color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                  Positioned(
                    top: -80,
                    left: 10,
                    child: Image.asset(
                      'assets/images/comment (2).png',
                      width: 30,
                    ),
                  ),
                ],
              ),
              hintText: 'أكتب...',
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_addressController.text.length}/20',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: _showPickTypeDialog,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[350],
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_selectedType == null ? 'النوع' : _selectedType),
                  Image.asset(
                    'assets/images/back.png',
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('الموقع'),
          const SizedBox(height: 10),
          TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            decoration: textFieldDecoration.copyWith(),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context).accentColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'إضافة',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
