import 'dart:convert';

import 'package:fyp_real/screens/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/member_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;

class MemberApiCalling {
  String baseUrl = 'http://192.168.0.113/ApiDemo/api/users';

  Future RegisterUser(email, password, name) async {
    try {
      String uri = '$baseUrl/RegisterUser';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted');
        Get.to(() => AuthScreen());
      } else
        print('insertion failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future LoginUser(email, password) async {
    try {
      String uri = '$baseUrl/loginuser?email=$email&password=$password';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print('Signed In');
        Get.to(() => MemberOverview());
      } else
        print('Authentication failed');
    } on Exception catch (e) {
      print(e);
    }
  }
}
