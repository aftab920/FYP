import 'dart:convert';

import 'package:fyp_real/screens/auth_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
//import '../controller/admin_api_calling.dart' as globals;
import '../controller/variables.dart' as globals;

class NgoApiCalling {
  //late String email;

  String baseUrl = 'http://192.168.0.113/ApiDemo/api/ngo';
  String baseUrlMedicine = 'http://192.168.0.113/ApiDemo/api/requested_med';

  Future RegisterNGO(name, email, password, regNo) async {
    try {
      //  this.email = email;
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
          "ngoregno": regNo,
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

  Future medicineRequest(
    String name,
    String quantity,
    String type,
  ) async {
    try {
      String uri = '$baseUrl/medicinerequest';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "quantity": quantity,
          "requested_by": globals.email,
          "type": type,
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

  // Future findNgo() async {
  //   try {
  //     String uri = '$baseUrl/findngo?email=$email';

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
}
