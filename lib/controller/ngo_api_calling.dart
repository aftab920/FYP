import 'dart:convert';

import 'package:fyp_real/screens/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;

class NgoApiCalling {
  String baseUrl = 'http://192.168.0.113/ApiDemo/api/ngo';

  Future RegisterNGO(name, email, password, phone) async {
    try {
      String uri = '$baseUrl/RegisterNGO';

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

  // Future LoginNGO(email, password) async {
  //   try {
  //     String uri = '$baseUrl/loginngo?email=$email&password=$password';

  //     var response = await http1.get(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //     );
  //     print(response.statusCode);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print('Signed In');
  //       Get.to(() => NGOOverview());
  //     } else
  //       print('Authentication failed');
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future medicineRequest()


}
