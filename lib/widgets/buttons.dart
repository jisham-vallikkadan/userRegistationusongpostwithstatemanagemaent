import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  void Function() buttonclik;
  // Color? buttoncolr;
  Color? buttontextcolor;
  double buttonleftmatgin;
  double buttonrightmargin;
  String buttontext;
  BoxDecoration? decoration;

  Buttons({
    Key? key,
    required this.buttonclik,
    // this.buttoncolr,
    required this.buttonleftmatgin,
    required this.buttonrightmargin,
    this.buttontextcolor,
    required this.buttontext,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: buttonleftmatgin, right: buttonrightmargin),
      width: double.maxFinite,
      height: 50,
      // color: buttoncolr,
      decoration: decoration,
      child: TextButton(
        onPressed: buttonclik,
        child: Text(
          buttontext,
          style: TextStyle(color: buttontextcolor, fontSize: 20),
        ),
      ),
    );
  }
}
