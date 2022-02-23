import 'dart:convert';

import 'package:fyp_real/controller/pharmacy_controller/cash_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/collected_cash_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/donation_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/medicine_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_cash_controller.dart';
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
        Get.snackbar("Successfull", "Called the Collector");
        Get.to(() => PharmacyOverview());
      } else {
        Get.snackbar("Error", "Something went wrong");
        print('Collector calling failed');
      }
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
        Get.snackbar("Successfull", "Added to the funds");
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
        Get.to(() => PharmacyOverview());
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
            "pharmacyid": loginPharmacyId.toString(),
            "wishlistid": wishlistId.toString(),
            "ngoid": ngoId.toString(),
            "quantity": quantity.toString(),
            "type": type.toString(),
            "medname": medName.toString(),
            "amountdonated": amountDonated.toString(),
            "expirydate": expiryDate.toString(),
          },
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print('Donated To admin');
        Get.snackbar("Successfull", "Donated Successfully");
        Get.to(() => PharmacyOverview());
      } else
        print('Donation To admin failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future allDonatedMeds() async {
    try {
      String uri =
          '${globals.baseUrl}/pharmacy/seedonatedmedicines?id=${globals.id}';

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

  Future<List> getCash() async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/getCash?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        print(data[0]);
        print(data[1]);
        return data;
        //Get.find<CashController>().cashRecord(response);
      } else {
        print('Failed');
        Get.to(() => PharmacyOverview());
        return data;
      }
    } on Exception catch (e) {
      print(e);
      var data;
      return data;
    }
  }

  Future generateReceipt(pharmId, amount, donorId, assisName) async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/generateReceipt';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "pharmacyId": pharmId.toString(),
            "amount": amount.toString(),
            "donorId": donorId.toString(),
            "AssistantName": assisName.toString(),
          },
        ),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Successfull", "Report sent to Donor");
        Get.to(() => PharmacyOverview());
      } else if (response.statusCode == 404) {
        Get.snackbar("Not Fount", "${response.body}");
      } else if (response.statusCode == 409) {
        Get.snackbar("Alert!", "${response.body}");
      } else {
        Get.snackbar("Error", "Unknown Error!");
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar('Failed', '$e');
    }
  }

  Future collectedCash() async {
    try {
      String uri = '${globals.baseUrl}/pharmacy/collectedCash?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<CollectedCashController>().allCollection(response);
      } else {
        print('Failed');
        Get.to(PharmacyOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
