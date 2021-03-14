import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/MyDialog.dart';

class AppCustomWidget extends StatefulWidget {
  @override
  _AppCustomWidgetState createState() => _AppCustomWidgetState();
}

class _AppCustomWidgetState extends State<AppCustomWidget> {
  static void doSomething(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyDialog()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppCustomWidget'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomTextWidget(
              textColor: Colors.black,
              text: 'My Text',
              textDecoration: TextDecoration.underline,
            ),
            CustomTextWidget(
              text: 'Forget password',
              textColor: Colors.green,
              isUnderlined: true,
            ),
            CustomCheckbox(
              text: 'Remember Me',
              checkboxColor: Colors.red,
              checkTickColor: Colors.green,
              isChecked: false,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  String text;
  String fontFamily;
  bool isClickable = false;
  final bool isUnderlined;

  Color textColor = Colors.black;
  double fontSize = 15;
  TextDecoration textDecoration;

  CustomTextWidget({
    this.textColor,
    this.isClickable,
    this.isUnderlined,
    this.fontFamily,
    this.fontSize,
    @required this.text,
    this.textDecoration,
  });
  CustomTextWidget setTextColor(Color color){
    this.textColor=color;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: textColor,
            decoration: textDecoration),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  String text;
  String fontFamily;
  bool isClickable = false;
  bool isUnderlined = false;
  Color textColor = Colors.black;
  double fontSize = 15;
  TextDecoration textDecoration;
  Color checkboxColor;
  Color checkTickColor;
  bool isChecked;

  CustomCheckbox(
      {this.textColor,
      this.isClickable,
      this.isUnderlined,
      this.fontFamily,
      this.fontSize,
      @required this.text,
      this.textDecoration,
      this.checkboxColor,
      @required this.isChecked,
      this.checkTickColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  // bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.isChecked,
            checkColor: widget.checkTickColor,
            activeColor: widget.checkboxColor,
            onChanged: (bool isCheck) {
              print('isChecked ${widget.isChecked}');
              setState(() {
                widget.isChecked = isCheck;
              });
            }),
        CustomTextWidget(text: widget.text)
      ],
    );
  }
}
