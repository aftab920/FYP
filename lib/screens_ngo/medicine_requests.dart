import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/medicine_requests_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:get/get.dart';

class MedicineRequests extends StatefulWidget {
  @override
  _MedicineRequestsState createState() => _MedicineRequestsState();
}

class _MedicineRequestsState extends State<MedicineRequests> {
  var medReq;
  late MedicineRequestsController allReqCtrl;

  @override
  void initState() {
    allReqCtrl = Get.put(MedicineRequestsController());
    NgoApiCalling().getMedicineRequests();
    super.initState();
  }

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
                  title: Text(medReq.Medname),
                  subtitle: Column(
                    children: [
                      Text('Type: ${medReq.type}'),
                      Text('Required Quantuty: ${medReq.quantity}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('✔'),
                        onPressed: () {
                          var healthunitstockId =
                              allReqCtrl.allRequests[index].stockid;
                          NgoApiCalling().acceptMedRequest(
                              healthunitstockId,
                              allReqCtrl.allRequests[index].name,
                              allReqCtrl.allRequests[index].quantity,
                              allReqCtrl.allRequests[index].type,
                              allReqCtrl.allRequests[index].huid);
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
