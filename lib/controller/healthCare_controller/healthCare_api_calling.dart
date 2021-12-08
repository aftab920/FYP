import 'dart:convert';

import 'package:fyp_real/screens/auth_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;

class HCApiCalling {
  String baseUrl = 'http://192.168.0.113/ApiDemo/api/HC';

  Future RegisterHC(name, email, password, phone, address) async {
    try {
      String uri = '$baseUrl/RegisterHC';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "address": address,
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
}
