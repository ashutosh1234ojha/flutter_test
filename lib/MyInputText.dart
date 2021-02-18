import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputText extends StatefulWidget {
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<MyInputText> {
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  String fname = "";
  String lname = "";
  String email = "";
  String address = "";
  bool isFnameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'InputText',
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(46, 113, 186, 1),
              Color.fromRGBO(111, 173, 244, 1),
              //  Color.fromRGBO(46, 113, 186, 1),
            ])),
        child: Container(
          margin: EdgeInsets.all(10),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyInputField(
                  hint: 'Enter first name',
                  label: 'First Name',
                  controller: firstNameController,
                  isValid: isFnameValid,
                  errorMsg: 'invalid first name',
                ),
                SizedBox(
                  height: 10,
                ),
                MyInputField(
                  hint: 'Enter email  id',
                  label: 'Email',
                  controller: emailController,
                  isValid: isEmailValid,
                  errorMsg: 'invalid email',
                ),
                SizedBox(
                  height: 10,
                ),
                MyInputField(
                  hint: 'Enter last  name',
                  label: 'Last Name',
                  controller: lastNameController,
                  isValid: isLastNameValid,
                  errorMsg: 'invalid last name',
                ),
                SizedBox(
                  height: 10,
                ),
                MyInputFormField(
                    hint: 'Enter your address',
                    label: 'Address',
                    controller: addressController,
                    isValid: isValid),
                SizedBox(
                  height: 50,
                ),
                Text('First name: $fname'),
                Text('Last name: $lname'),
                Text('Email: $email'),
                Text('Address: $address'),
                FlatButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    setState(() {
                      fname = firstNameController.text;
                      lname = lastNameController.text;
                      email = emailController.text;
                      address = addressController.text;

                      if (address.length < 3 ||
                          fname.length < 3 ||
                          lname.length < 3 ||
                          !email.contains('@')) {
                        isFnameValid = false;
                        isLastNameValid = false;
                        isEmailValid = false;
                        isValid = false;
                      } else {
                        isFnameValid = true;
                        isLastNameValid = true;
                        isEmailValid = true;
                        isValid = true;
                      }
                    });
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyInputField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final bool isValid;
  final String errorMsg;

  const MyInputField(
      {Key key,
      this.hint,
      this.label,
      this.controller,
      this.isValid,
      this.errorMsg})
      : super(key: key);

  @override
  _MyInputFieldState createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  var textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              errorText: widget.isValid ? widget.errorMsg : null,
              hintText: widget.hint,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.red, width: 1.0),
              // ),
              fillColor: Color.fromRGBO(102, 167, 240, 1),
              filled: true,
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(102, 167, 240, 1), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(102, 167, 240, 1), width: 1.0),
              )),
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          maxLines: 1,
        ),
      ],
    );
  }
}

class MyInputFormField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final bool isValid;

  const MyInputFormField(
      {Key key, this.hint, this.label, this.controller, this.isValid})
      : super(key: key);

  @override
  _MyInputFormFieldState createState() => _MyInputFormFieldState();
}

class _MyInputFormFieldState extends State<MyInputFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Form(
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
                errorText: widget.isValid ? null : 'enter valid address',
                hintText: widget.hint,
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red, width: 1.0),
                // ),
                fillColor: Color.fromRGBO(102, 167, 240, 1),
                filled: true,
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(102, 167, 240, 1), width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(102, 167, 240, 1), width: 1.0),
                )),
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.name,
            maxLines: 1,
            validator: (String value) {
              return value.length > 3 ? 'Do not use the @ char.' : null;
            },
          ),
        ),
      ],
    );
  }
}
