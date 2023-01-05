import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  String? hinttext;
  String? labeltext;
  TextEditingController? controller;
  bool obscureText;

  Field({
    Key? key,
    this.labeltext,
    this.hinttext,
    this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(0)),
          hintText: hinttext,
          labelText: labeltext,
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }
}
