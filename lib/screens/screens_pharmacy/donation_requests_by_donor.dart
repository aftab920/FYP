import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/donation_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/input_donated_amount_by_donor.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

class DonationRequestsByDonor extends StatefulWidget {
  @override
  State<DonationRequestsByDonor> createState() =>
      _DonationRequestsByDonorState();
}

class _DonationRequestsByDonorState extends State<DonationRequestsByDonor> {
  var donReq;
  late DonationRequestsController allReqCtrl;
  // = Get.find<MedicineRequestsController>();

  void _addAmount(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: InputDonatedAmountByDonor(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void initState() {
    allReqCtrl = Get.put(DonationRequestsController());
    PharmacyApiCalling().getDonationRequests(globals.id);
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
            donReq = allReqCtrl.allRequests[index];

            return Card(
              elevation: 5,
              child: ListTile(
                  title: Text(donReq.name),
                  subtitle: Column(
                    children: [
                      Text('Amount: ${donReq.amount}'),
                      Text('Address: ${donReq.address}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('✔'),
                        onPressed: () {
                          globals.donorId = allReqCtrl.allRequests[index].id;
                          _addAmount(context);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                      ElevatedButton(
                        child: Text('✖'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ],
                  )
                  // trailing: Text(int.parse(donReq.id)),
                  ),
            );
          },
          itemCount: allReqCtrl.allRequests.length,
        ),
      ),
    );
  }
}
