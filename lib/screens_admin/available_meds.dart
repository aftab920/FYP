import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/medicine_available_controller.dart';
import 'package:fyp_real/controller/admin_controller/medicine_stock_controller.dart';
import 'package:get/get.dart';

class AvailableMeds extends StatefulWidget {
  @override
  _AvailableMedsState createState() => _AvailableMedsState();
}

class _AvailableMedsState extends State<AvailableMeds> {
  var availMed;
  late MedicineAvailableController medStockCtrl;
  @override
  void initState() {
    medStockCtrl = Get.put(MedicineAvailableController());
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
            availMed = medStockCtrl.allAvailable[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(availMed.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text('Quantity: ${availMed.quantity}'),
                    Text('Expiry: ${DateTime.parse(availMed.date)}'),
                  ],
                ),
              ),
            );
          },
          itemCount: medStockCtrl.allAvailable.length,
        ),
      ),
    );
  }
}
