import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapipostmethord/loginpage.dart';
import 'package:loginapipostmethord/main.dart';
import 'package:loginapipostmethord/providerclass.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apiclass.dart';
import 'widgets/buttons.dart';
import 'widgets/fiels.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class Registationpage extends StatefulWidget {
  Registationpage({Key? key}) : super(key: key);

  @override
  State<Registationpage> createState() => _RegistationpageState();
}

class _RegistationpageState extends State<Registationpage> {
  @override
  @override
  // ApiClient apiClient = ApiClient();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailcontoelr = TextEditingController();

  TextEditingController nameconatoler = TextEditingController();

  TextEditingController passwordcontroler = TextEditingController();

  TextEditingController placecontroler = TextEditingController();
  TextEditingController postcontroler = TextEditingController();
  TextEditingController pincontroler = TextEditingController();
  TextEditingController citycontroler = TextEditingController();

  TextEditingController numbercontroler = TextEditingController();
  TextEditingController rolecontroler = TextEditingController();

  // TextEditingController datacontroler = TextEditingController();

  Widget build(BuildContext context) {
    // var name = context.watch<HttpPostprovider>().name;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffB4D1E7FF),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Registation',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Field(
                    obscureText: false,
                    controller: nameconatoler,
                    hinttext: 'Enter Username',
                    labeltext: 'Username',
                  ),
                  Field(
                    obscureText: false,
                    hinttext: 'Enter Email',
                    labeltext: 'Email',
                    controller: emailcontoelr,
                  ),
                  Field(
                    obscureText: false,
                    hinttext: 'eg; 9961333048',
                    controller: numbercontroler,
                    labeltext: "phone number",
                  ),
                  Field(
                    obscureText: false,
                    controller: passwordcontroler,
                    hinttext: 'password',
                    labeltext: 'Password',
                  ),
                  Field(
                    obscureText: false,
                    controller: placecontroler,
                    hinttext: "place",
                  ),
                  Field(
                    obscureText: false,
                    controller: postcontroler,
                    hinttext: "post",
                  ),
                  Field(
                    obscureText: false,
                    controller: pincontroler,
                    hinttext: "pin",
                  ),
                  Field(
                    obscureText: false,
                    controller: citycontroler,
                    hinttext: "city",
                  ),
                  Field(
                    obscureText: false,
                    controller: rolecontroler,
                    hinttext: "role",
                  ),
                  Buttons(
                    buttonclik: () async {
                      // registeruser();
                      Provider.of<HttpPostprovider>(context, listen: false)
                          .userRegistration(({
                        'name': nameconatoler.text,
                        'email': emailcontoelr.text,
                        'mobile_number': numbercontroler.text,
                        'place': placecontroler.text,
                        'post': postcontroler.text,
                        'pincode': pincontroler.text,
                        'password': passwordcontroler.text,
                        'city': citycontroler.text,
                        'role': rolecontroler.text,
                      }));

                      if (nameconatoler.text == '') {
                        Fluttertoast.showToast(msg: 'enter values');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ));
                      }
                    },
                    buttontext: 'sign up',
                    buttonleftmatgin: 50,
                    buttonrightmargin: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    buttontextcolor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future registeruser() async {
  //   var useradata = {
  //     'name': nameconatoler.text,
  //     'email': emailcontoelr.text,
  //     'mobile_number': numbercontroler.text,
  //     'place': placecontroler.text,
  //     'post': postcontroler.text,
  //     'pincode': pincontroler.text,
  //     'password': passwordcontroler.text,
  //     'city': citycontroler.text,
  //     'role': rolecontroler.text,
  //   };
  //   var url = 'https://maitexa.in/water-delivery-api/api/customer-register';
  //   var responce = await http.post(Uri.parse(url), body: useradata);
  //   var body = jsonDecode(responce.body);
  //   print(body);
  //   if (body['success'] == 0 &&
  //       emailcontoelr.text != '' &&
  //       passwordcontroler.text != '') {
  //     Fluttertoast.showToast(msg: 'Registration success');
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Loginpage(),
  //         ));
  //   }
  // }
}
