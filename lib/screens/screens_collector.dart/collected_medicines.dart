import 'package:flutter/material.dart';
import 'package:fyp_real/controller/collector_controller/collected_medicine_controller.dart';
import 'package:fyp_real/controller/collector_controller/collector_api_calling.dart';
import 'package:get/get.dart';

class CollectedMedicines extends StatefulWidget {
  @override
  State<CollectedMedicines> createState() => _CollectedMedicinesState();
}

class _CollectedMedicinesState extends State<CollectedMedicines> {
  var allCollected;
  late CollectedMedicinesController allCollectedCtrl;

  void initState() {
    allCollectedCtrl = Get.put(CollectedMedicinesController());
    CollectorApiCalling().getCollectedMedicines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Donation Requests'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            allCollected = allCollectedCtrl.allCollected[index];

            return Card(
              elevation: 5,
              color: Colors.green,
              child: ListTile(
                leading: Icon(Icons.medication),
                title: Text(allCollected.medName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donated By: ${allCollected.name}'),
                    Text('Quantity: ${allCollected.quantity}'),
                  ],
                ),
              ),
            );
          },
          itemCount: allCollectedCtrl.allCollected.length,
        ),
      ),
    );
  }
}
