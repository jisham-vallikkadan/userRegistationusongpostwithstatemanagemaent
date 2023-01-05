import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpPostprovider with ChangeNotifier {
  String _Name = 'provider';



  Future userRegistration(Map<String, dynamic> userdata) async {
    var url = 'https://maitexa.in/water-delivery-api/api/customer-register';
    var responce = await http.post(Uri.parse(url), body: userdata);
    var body = jsonDecode(responce.body);
    print(body);
  }

  Future userLogin(Map<String, dynamic> logindata) async {

    print('sfgd');
    var url = 'https://maitexa.in/water-delivery-api/api/login';
    var responce = await http.post(Uri.parse(url), body: logindata);
    var res = jsonDecode(responce.body);
    print(res);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool error = res['error'];
    int ?loginid = res['loginid'];
    preferences.setString('Login', loginid.toString());
    preferences.setBool("Error", error);
    print('erros is'+error.toString());
    print('loginid is'+loginid.toString());

    print(res);
  }

  String? name;
  String? place;
  String? number;
  String? email;
  String? post;
  String? pincode;
  String? city;



   Future getuserdata(String token)async {
    var url='https://maitexa.in/water-delivery-api/api/get-customer-info/${token}';
    var responce= await http.get(Uri.parse(url));
    if(responce.statusCode==200){
      var body=jsonDecode(responce.body);
      print(body);
      name = body['customer_info']['name'];
      email = body['customer_info']['email'];
      number = body['customer_info']['mobile_number'];
      place = body['customer_info']['place'];
      pincode = body['customer_info']['pincode'];
      city = body['customer_info']['city'];
      post = body['customer_info']['post'];
    }
   }

}

// {success: 0, error: true, message: All fields are required!}
