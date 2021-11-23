import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/medicine_available_controller.dart';
import 'package:get/get.dart';

class AvailableMedicines extends StatefulWidget {
  @override
  _AvailableMedicinesState createState() => _AvailableMedicinesState();
}

class _AvailableMedicinesState extends State<AvailableMedicines> {
  var medAvailable;
  late MedicineAvailableController medAvailableCtrl;
  @override
  void initState() {
    medAvailableCtrl = Get.put(MedicineAvailableController());
    AdminApiCalling().getAvailableMedicine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Available Medicines'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            medAvailable = medAvailableCtrl.allAvailable[index];

            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(medAvailable.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text('Quantity: ${medAvailable.quantity.toString()}'),
                    Text('Date: ${medAvailable.date}'),
                  ],
                ),
              ),
            );
          },
          itemCount: medAvailableCtrl.allAvailable.length,
        ),
      ),
    );
  }
}
