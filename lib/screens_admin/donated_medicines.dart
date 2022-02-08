import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_controller/medicine_donated_controller.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';

class DonatedMedicines extends StatefulWidget {
  @override
  State<DonatedMedicines> createState() => _DonatedMedicinesState();
}

class _DonatedMedicinesState extends State<DonatedMedicines> {
  var medDon;
  late MedicineDonatedController allDonCtrl;
  @override
  void initState() {
    allDonCtrl = Get.put(MedicineDonatedController());
    AdminApiCalling().getMedicineDonated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Medicines Donated'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            medDon = allDonCtrl.allDonated[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(medDon.medName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text('Donated To: ${medDon.name}'),
                    Text('Quantity: ${medDon.quantity}'),
                    //Text('Date: ${medDon.date}'),
                  ],
                ),
              ),
            );
          },
          itemCount: allDonCtrl.allDonated.length,
        ),
      ),
    );
  }
}
