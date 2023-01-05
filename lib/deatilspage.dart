import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginapipostmethord/loginpage.dart';
import 'package:loginapipostmethord/main.dart';
import 'package:http/http.dart' as http;
import 'package:loginapipostmethord/providerclass.dart';
import 'package:loginapipostmethord/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Detailspage extends StatefulWidget {
  String token;

  Detailspage({Key? key, required this.token}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<HttpPostprovider>(context,listen: false).getuserdata(widget.token);

    print("value is"+widget.token.toString());
  }




  @override
  Widget build(BuildContext context) {
    var userdata=Provider.of<HttpPostprovider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   title: Center(child: Text('${name}')),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('images/user-login-icon-14.png'),
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Name :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.name}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Email :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.email}',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Mobile :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.number}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Place :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.place}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Pincode :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.pincode}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'City :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.city}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Post :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Expanded(
                            child: Text(
                              '${userdata.post}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Buttons(
                        buttonclik: () async {
                          SharedPreferences pres=await SharedPreferences.getInstance();
                          pres.clear();
                          Navigator.pop(context);

                        },
                        decoration: BoxDecoration(color: Colors.white),
                        buttonleftmatgin: 100,
                        buttonrightmargin: 100,
                        buttontext: 'Back'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
