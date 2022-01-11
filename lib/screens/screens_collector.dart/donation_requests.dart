import 'package:flutter/material.dart';
import 'package:fyp_real/controller/collector_controller/collector_api_calling.dart';
import 'package:fyp_real/controller/collector_controller/donation_requests_controller.dart';
import 'package:fyp_real/widgets/widgets_collector/add_medicine_form.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

class DonationRequests extends StatefulWidget {
  @override
  State<DonationRequests> createState() => _DonationRequestsState();
}

class _DonationRequestsState extends State<DonationRequests> {
  var donorId;
  var donReq;
  late DonationRequestsController allReqCtrl;
  // = Get.find<MedicineRequestsController>();

  void _addMedicine(BuildContext ctx, id) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddMedicineForm(id),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void initState() {
    allReqCtrl = Get.put(DonationRequestsController());
    CollectorApiCalling().getDonationRequests();
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
                          donorId = donReq.id;
                          CollectorApiCalling().acceptDonation(donReq.id);
                          _addMedicine(context, donorId);
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