import 'dart:convert';

import 'package:fyp_real/controller/pharmacy_controller/donation_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/medicine_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_donated_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../../controller/variables.dart' as globals;

class PharmacyApiCalling {
  Future RegisterPharmacy(name, email, password, address, phone, type) async {
    try {
      String uri = '${globals.baseUrl}/userData/RegisterUser';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,
          "address": address,
          "phone": phone,
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

  Future DonateMed(id) async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/donatemed?id=$id';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "id": id.toString(),
          },
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print('Called the collector');
        Get.to(() => PharmacyOverview());
      } else
        print('Collector calling failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getDonationRequests(id) async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/allDonationRequests?id=$id';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<DonationRequestsController>().allDonationRequests(response);
      } else {
        print('Failed');
        Get.to(PharmacyOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future acceptDonation(pharmacyId, donorId, amount) async {
    try {
      String uri =
          '${globals.baseUrl}/pharmacy/acceptdonation?pharmacyId=$pharmacyId&donorId=$donorId&amount=$amount';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "pharmacyId": pharmacyId.toString(),
            "donorId": donorId.toString(),
            "amount": amount.toString(),
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
      } else {
        print('Failed');
        Get.to(() => PharmacyOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMedicineRequests(id) async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/allMedicineRequests?id=$id';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<MedicineRequestsControllerPharmacy>()
            .allMedicineRequests(response);
      } else {
        print('Failed');
        Get.to(PharmacyOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future donateToAdmin(loginPharmacyId, wishlistId, ngoId, quantity, type,
      medName, amountDonated, expiryDate) async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/givemedbycash';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "pharmacyid": loginPharmacyId,
            "wishlistid": wishlistId,
            "ngoid": ngoId,
            "quantity": quantity,
            "type": type,
            "medname": medName,
            "amountdonated": amountDonated,
            "expirydate": expiryDate,
          },
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print('Donated To admin');
        Get.to(() => PharmacyOverview());
      } else
        print('Donation To admin failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future allDonatedMeds() async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/alldonated?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<PharmacyDonatedController>().allDonatedMeds(response);
      } else {
        print('Failed');
        Get.to(PharmacyOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
