import 'dart:convert';

import 'package:fyp_real/controller/medicine_requests_controller.dart';
import 'package:fyp_real/model/medicine_requests_model.dart';
import 'package:fyp_real/screens_admin/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens_user/member_overview.dart';
import 'package:fyp_real/screens_ngo/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../controller/variables.dart' as globals;

class AdminApiCalling {
  static late String email;
  //final allRequestsController = Get.put(MedicineRequestsController());

  //String baseUrl = 'http://192.168.0.113/ApiDemo/api/';
  String baseUrl = 'http://192.168.100.202/ApiDemo/api/';

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

  Future medicineRequest(
    String name,
    String quantity,
    String type,
  ) async {
    try {
      String uri = '$baseUrl/admins/addmedicinerequest';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "quantity": quantity,
          // "requested_by": globals.email,
          "type": type,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted');
        Get.to(() => NGOOverview());
      } else
        print('insertion failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMedicineRequests() async {
    // Response response;
    try {
      // response = await Dio()
      //     .get('http://192.168.170.35/WebAPIDemo/api/users/allusers');
      String uri = '$baseUrl/admins/allRequestedMedicines';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        // var job = '{"Name":"Ali","Email":"abc","Password":"Pass","Id":1}';
        // jsonDecode(job);
        // Iterable it = jsonDecode(response.body);
        // allRequests = it.map((e) => MedicineRequestsModel.fromMap(e)).toList();
        //int x = -90;
        // listUserResponse = ListUserResponse.fromJson(response.data);
        // users = listUserResponse.user;

        Get.find<MedicineRequestsController>().allMedicneRequests(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
