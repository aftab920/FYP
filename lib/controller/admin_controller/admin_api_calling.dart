import 'dart:convert';

import 'package:fyp_real/controller/admin_controller/all_users_controller.dart';
import 'package:fyp_real/controller/admin_controller/medicine_available_controller.dart';
import 'package:fyp_real/controller/admin_controller/medicine_donated_controller.dart';
import 'package:fyp_real/controller/admin_controller/medicine_requests_controller.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_overview.dart';
import 'package:fyp_real/screens_admin/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens_donar/member_overview.dart';
import 'package:fyp_real/screens_ngo/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../variables.dart' as globals;

class AdminApiCalling {
  static late String email;
  //final allRequestsController = Get.put(MedicineRequestsController());

  String baseUrl = 'http://192.168.0.111/ApiDemo/api/';
  // String baseUrl = 'http://192.168.100.44/ApiDemo/api/';   // SZ 1st Floor
  // String baseUrl = 'http://192.168.100.202/ApiDemo/api/';  // Home

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
      String uri =
          '$baseUrl/userdata/LoginUser?email=$email&password=$password';
      /////////// C A S E 1 ----------

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      print('data: $data');
      print(data[0]);
      print(data[1]);

      if (response.statusCode == 200) {
        globals.id = data[0];

        if (data[1] == 'donor' || data[1] == 'Donor')
          Get.to(() => MemberOverview());
        if (data[1] == 'Admin' || data[1] == 'admin')
          Get.to(() => AdminOverview());
        if (data[1] == 'Pharmacy' || data[1] == 'pharmacy')
          Get.to(() => PharmacyOverview());
        if (data[1] == 'NGO' || data[1] == 'ngo' || data[1] == 'Ngo')
          Get.to(() => NGOOverview());
        //if (response.body == 'HealthCare') Get.to(() => HCOverview());
      } else {
        print('User not found');
      }

      // /////////// C A S E 2 ----------

      // String uri2 = '$baseUrl/users/loginuser?email=$email&password=$password';
      // var response2 = await http1.get(
      //   Uri.parse(uri2),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8'
      //   },
      // );
      // print(response2.statusCode);
      // print(response2.body);
      // if (response2.statusCode == 200) {
      //   globals.email = email;
      //   print('Signed In User');
      //   Get.to(() => MemberOverview());
      // }

      // /////////// C A S E 3 ----------

      // String uri3 = '$baseUrl/ngo/loginngo?email=$email&password=$password';
      // var response3 = await http1.get(
      //   Uri.parse(uri3),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8'
      //   },
      // );
      // print(response3.statusCode);
      // print(response3.body);
      // if (response3.statusCode == 200) {
      //   globals.email = email;
      //   print('Signed In NGO');
      //   Get.to(() => NGOOverview());
      // }
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
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMedicineDonated() async {
    // Response response;
    try {
      // response = await Dio()
      //     .get('http://192.168.170.35/WebAPIDemo/api/users/allusers');
      String uri = '$baseUrl/admins/allDonatedMedicines';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<MedicineDonatedController>().allMedicineDonated(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAvailableMedicine() async {
    // Response response;
    try {
      // response = await Dio()
      //     .get('http://192.168.170.35/WebAPIDemo/api/users/allusers');
      String uri = '$baseUrl/admins/allAvailableMedicines';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<MedicineAvailableController>().allAvailableMedicine(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAllUsers() async {
    try {
      String uri = '$baseUrl/admins/allUsers';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<AllUsersController>().allRegisteredUsers(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
