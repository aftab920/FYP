import 'package:flutter/material.dart';
import 'package:fyp_real/controller/donar_controller/donated_cash_controller.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import 'package:get/get.dart';

class CashDonated extends StatefulWidget {
  @override
  State<CashDonated> createState() => _CashDonatedState();
}

class _CashDonatedState extends State<CashDonated> {
  var donated;
  late DonatedCashController allDonatedCtrl;

  void initState() {
    allDonatedCtrl = Get.put(DonatedCashController());
    MemberApiCalling().getDonatedCash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Donations'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            donated = allDonatedCtrl.cash[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text('Pharmacy Name: ${donated.pharmName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cash: ${donated.amount}'),
                  ],
                ),
              ),
            );
          },
          itemCount: allDonatedCtrl.cash.length,
        ),
      ),
    );
  }
}
