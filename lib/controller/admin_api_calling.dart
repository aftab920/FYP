import 'dart:convert';

import 'package:fyp_real/screens/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/member_overview.dart';
import 'package:fyp_real/screens/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../controller/variables.dart' as globals;

class AdminApiCalling {
  static late String email;
  String baseUrl = 'http://192.168.0.113/ApiDemo/api/';

  Future RegisterAdmin(email, password) async {
    try {
      String uri = '$baseUrl/admins/RegisterAdmin';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
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

  Future LoginAdmin(email, password) async {
    try {
      String uri = '$baseUrl/admins/loginadmin?email=$email&password=$password';
      /////////// C A S E 1 ----------

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        globals.email = email;
        print('Signed In Admin');
        Get.to(() => AdminOverview());
      }

      /////////// C A S E 2 ----------

      String uri2 = '$baseUrl/users/loginuser?email=$email&password=$password';
      var response2 = await http1.get(
        Uri.parse(uri2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response2.statusCode);
      print(response2.body);
      if (response2.statusCode == 200) {
        globals.email = email;
        print('Signed In User');
        Get.to(() => MemberOverview());
      }

      /////////// C A S E 3 ----------

      String uri3 = '$baseUrl/ngo/loginngo?email=$email&password=$password';
      var response3 = await http1.get(
        Uri.parse(uri3),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response3.statusCode);
      print(response3.body);
      if (response3.statusCode == 200) {
        globals.email = email;
        print('Signed In NGO');
        Get.to(() => NGOOverview());
      } else
        print('Authentication failed');
    } on Exception catch (e) {
      print(e);
    }
  }
}
