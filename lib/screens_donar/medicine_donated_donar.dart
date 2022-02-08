import 'package:flutter/material.dart';
import 'package:fyp_real/controller/donar_controller/donated_med_controller.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import 'package:get/get.dart';

class MedicineDonatedDonar extends StatefulWidget {
  @override
  State<MedicineDonatedDonar> createState() => _MedicineDonatedDonarState();
}

class _MedicineDonatedDonarState extends State<MedicineDonatedDonar> {
  var donated;
  late DonatedMedController allDonatedCtrl;
  @override
  void initState() {
    allDonatedCtrl = Get.put(DonatedMedController());
    MemberApiCalling().getDonatedMeds();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Donated Medicines'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            donated = allDonatedCtrl.medicines[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(donated.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity: ${donated.quantity}'),
                  ],
                ),
              ),
            );
          },
          itemCount: allDonatedCtrl.medicines.length,
        ),
      ),
    );
  }
}
