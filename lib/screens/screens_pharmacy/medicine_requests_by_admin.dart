import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/medicine_requests_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/input_donated_amount.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

class MedicineRequestsByAdmin extends StatefulWidget {
  @override
  State<MedicineRequestsByAdmin> createState() =>
      _MedicineRequestsByAdminState();
}

class _MedicineRequestsByAdminState extends State<MedicineRequestsByAdmin> {
  var medReq;
  late MedicineRequestsControllerPharmacy allReqCtrl;
  // = Get.find<MedicineRequestsController>();

  void _addAmount(BuildContext ctx, wishId, ngoId, quantity, type, medName) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: InputDonatedAmount(wishId, ngoId, quantity, type, medName),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void initState() {
    allReqCtrl = Get.put(MedicineRequestsControllerPharmacy());
    PharmacyApiCalling().getMedicineRequests(globals.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Medicine Requests'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            medReq = allReqCtrl.allRequests[index];

            return Card(
              elevation: 5,
              child: ListTile(
                  title: Text(medReq.medName),
                  subtitle: Column(
                    children: [
                      Text('Type: ${medReq.type}'),
                      Text('Quantuty: ${medReq.quantity}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('✔'),
                        onPressed: () {
                          var medId = allReqCtrl.allRequests[index].wishid;
                          _addAmount(
                            context,
                            medId,
                            allReqCtrl.allRequests[index].requestedNgoId,
                            allReqCtrl.allRequests[index].quantity,
                            allReqCtrl.allRequests[index].type,
                            allReqCtrl.allRequests[index].medName,
                          );
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
