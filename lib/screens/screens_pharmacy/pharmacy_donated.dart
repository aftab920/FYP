import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_donated_controller.dart';
import 'package:get/get.dart';

class PharmacyDonated extends StatefulWidget {
  @override
  State<PharmacyDonated> createState() => _PharmacyDonatedState();
}

class _PharmacyDonatedState extends State<PharmacyDonated> {
  var meds;

  late PharmacyDonatedController medsCtrl;

  @override
  void initState() {
    medsCtrl = Get.put(PharmacyDonatedController());
    PharmacyApiCalling().allDonatedMeds();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines Donated'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  meds = medsCtrl.donatedMeds[index];
                  if (meds != null) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(meds.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // SizedBox(
                            //   height: 15,
                            // ),
                            //Text('Amount: ${meds.amount}'),
                            Text('Donated quantity: ${meds.quantity}'),
                            Text('Type: ${meds.type}'),
                            Text('Expiry: ${meds.expiry}')
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('No Data Found');
                  }
                },
                itemCount: medsCtrl.donatedMeds.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
