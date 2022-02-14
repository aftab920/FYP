import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/pharmacy_controller.dart';
import 'package:get/get.dart';

class PharmaciesList extends StatefulWidget {
  @override
  State<PharmaciesList> createState() => _PharmaciesListState();
}

class _PharmaciesListState extends State<PharmaciesList> {
  var pharmacy;
  late PharmacyController pharmCtrl;
  var wishlistID = Get.arguments;

  @override
  void initState() {
    pharmCtrl = Get.put(PharmacyController());
    AdminApiCalling().getPharmacies();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pharmacies'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            pharmacy = pharmCtrl.pharmacylist[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(pharmacy.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Available Fund: ${pharmacy.cash}'),
                    Text('Address: ${pharmacy.address}'),
                  ],
                ),
                trailing: ElevatedButton(
                    child: Text('Request'),
                    onPressed: () {
                      var pharmacyID = pharmCtrl.pharmacylist[index].id;
                      AdminApiCalling()
                          .openReqByAdmin(wishlistID[0], pharmacyID);
                    }),
              ),
            );
          },
          itemCount: pharmCtrl.pharmacylist.length,
        ),
      ),
    );
  }
}
