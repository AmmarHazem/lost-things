import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

import '../styles.dart';
import './categories_carousel.dart';
import 'my_alert_dialog.dart';

class ReportMissingPage extends StatefulWidget {
  @override
  _ReportMissingPageState createState() => _ReportMissingPageState();
}

class _ReportMissingPageState extends State<ReportMissingPage> {
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType;
  List<File> _selectedImages = [
    null,
    null,
    null,
  ];

  void _selectImage(int index) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImages[index] = image;
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

  void _setSelectedType(String value) {
    setState(() {
      _selectedType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pickedImageSize = 50.0;
    return Column(
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
                  color: Colors.grey,
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
                  width: 30,
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
        const SizedBox(height: 20),
        Text('إضافة صورة'),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            DottedBorder(
              child: _selectedImages[0] == null
                  ? IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _selectImage(0),
                      color: Theme.of(context).accentColor,
                    )
                  : Image.file(
                      _selectedImages[0],
                      width: pickedImageSize,
                      height: pickedImageSize,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 10),
            DottedBorder(
              child: _selectedImages[1] == null
                  ? IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _selectImage(1),
                      color: Theme.of(context).accentColor,
                    )
                  : Image.file(
                      _selectedImages[1],
                      width: pickedImageSize,
                      height: pickedImageSize,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 10),
            DottedBorder(
              child: _selectedImages[2] == null
                  ? IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _selectImage(2),
                      color: Theme.of(context).accentColor,
                    )
                  : Image.file(
                      _selectedImages[2],
                      width: pickedImageSize,
                      height: pickedImageSize,
                      fit: BoxFit.cover,
                    ),
            ),
          ],
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
    );
  }
}

class SelectTypeDialogContent extends StatelessWidget {
  final Function onSelectType;

  const SelectTypeDialogContent({
    Key key,
    @required this.onSelectType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageHeight = 30.0;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/9876 (6).png',
                  height: imageHeight,
                ),
                name: 'أغراض شخصية',
                onTap: () {
                  onSelectType('أغراض شخصية');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/tv.png',
                  height: imageHeight,
                ),
                name: 'إلكترونيات',
                onTap: () {
                  onSelectType('إلكترونيات');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/shirt.png',
                  height: imageHeight,
                ),
                name: 'ملابس',
                onTap: () {
                  onSelectType('ملابس');
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/9876 (6).png',
                  height: imageHeight,
                ),
                name: 'أغراض شخصية',
                onTap: () {
                  onSelectType('أغراض شخصية');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/tv.png',
                  height: imageHeight,
                ),
                name: 'إلكترونيات',
                onTap: () {
                  onSelectType('إلكترونيات');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/shirt.png',
                  height: imageHeight,
                ),
                name: 'ملابس',
                onTap: () {
                  onSelectType('ملابس');
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/9876 (6).png',
                  height: imageHeight,
                ),
                name: 'أغراض شخصية',
                onTap: () {
                  onSelectType('أغراض شخصية');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/tv.png',
                  height: imageHeight,
                ),
                name: 'إلكترونيات',
                onTap: () {
                  onSelectType('إلكترونيات');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CategoriesSliderItem(
                horizontalMargin: 0,
                icon: Image.asset(
                  'assets/images/shirt.png',
                  height: imageHeight,
                ),
                name: 'ملابس',
                onTap: () {
                  onSelectType('ملابس');
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CategoriesSliderItem(
              horizontalMargin: 0,
              icon: Image.asset(
                'assets/images/9876 (6).png',
                height: imageHeight,
              ),
              name: 'أغراض شخصية',
              onTap: () {
                onSelectType('أغراض شخصية');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
