import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/medicine_stock_controller.dart';
import 'package:get/get.dart';

class TotalStock extends StatefulWidget {
  @override
  _TotalStockState createState() => _TotalStockState();
}

class _TotalStockState extends State<TotalStock> {
  var medStock;
  late MedicineStockController medStockCtrl;
  @override
  void initState() {
    medStockCtrl = Get.put(MedicineStockController());
    AdminApiCalling().getStockMedicine();
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
            medStock = medStockCtrl.allStock[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(medStock.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Text('Quantity: ${medStock.quantity}'),
                  ],
                ),
              ),
            );
          },
          itemCount: medStockCtrl.allStock.length,
        ),
      ),
    );
  }
}
