import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {

  // Future refisteruser(Map<String, dynamic> datas) async {
  //   var url = 'https://maitexa.in/water-delivery-api/api/customer-register';
  //   var regrespose = await http.post(Uri.parse(url), body: datas);
  //   var body = jsonDecode(regrespose.body);
  //   print(body);
  //   return body;
  // }

  Future loginuser(Map<String, dynamic> logindata,) async {
    var url = 'https://maitexa.in/water-delivery-api/api/login';
    var loginresponse = await http.post(Uri.parse(url), body: logindata);
    var body = json.decode(loginresponse.body);
    print(body);
    SharedPreferences sptoken= await SharedPreferences.getInstance();
    print(body['loginid']);
   int tkn = body['loginid'];
   int sucess =body["success"];
   sptoken.setInt('logintoken', tkn);
   sptoken.setInt('losginestsus', sucess);


  }
}
