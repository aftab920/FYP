import 'package:flutter/material.dart';
import 'package:fyp_real/controller/healthUnit_controller/healthUnit_api_calling.dart';
import 'package:fyp_real/controller/healthUnit_controller/med_requests_controller.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

enum RequestType { pending, issued, recieved }

class MedRequestsStatus extends StatefulWidget {
  @override
  _MedRequestsStatusState createState() => _MedRequestsStatusState();
}

class _MedRequestsStatusState extends State<MedRequestsStatus> {
  RequestType _requestType = RequestType.pending;
  var reqStatus;
  late MedRequestsStatusController reqStatusCtrl;
  @override
  void initState() {
    reqStatusCtrl = Get.put(MedRequestsStatusController());
    HUApiCalling().getMedicineRequestsStatus(RequestType.pending);
    super.initState();
  }

  void fetchStatusRelatedData(val) {
    HUApiCalling().getMedicineRequestsStatus(val);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Donation Requests'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Pending', style: Theme.of(context).textTheme.subtitle1),
              Radio(
                value: RequestType.pending,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                      fetchStatusRelatedData(val);
                    },
                  );
                },
              ),
              Text('Issued', style: Theme.of(context).textTheme.subtitle1),
              Radio(
                value: RequestType.issued,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                      fetchStatusRelatedData(val);
                    },
                  );
                },
              ),
              Text('Recieved', style: Theme.of(context).textTheme.subtitle1),
              Radio(
                value: RequestType.recieved,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                      fetchStatusRelatedData(val);
                    },
                  );
                },
              ),
            ],
          ),

          ///                       /////////////
          ////                      ////////////
          ///// Issued case manage  ///////////
          if (_requestType == RequestType.issued)
            Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  reqStatus = reqStatusCtrl.reqStatus[index];

                  return Card(
                    elevation: 5,
                    child: ListTile(
                        title: Text(reqStatus.medName),
                        subtitle: Column(
                          children: [
                            Text('Quantity Issued: ${reqStatus.quantity}'),
                            Text('Type: ${reqStatus.type}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              child: Text('✔'),
                              onPressed: () {
                                globals.donorId =
                                    reqStatusCtrl.reqStatus[index].id;
                                //_addAmount(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                            ),
                            ElevatedButton(
                              child: Text('✖'),
                              onPressed: () {},
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                          ],
                        )
                        // trailing: Text(int.parse(donReq.id)),
                        ),
                  );
                },
                itemCount: reqStatusCtrl.reqStatus.length,
              ),
            ),

          ///                       /////////////
          ////                      ////////////
          ///// Pending case manage  ///////////
          if (_requestType == RequestType.pending)
            Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  reqStatus = reqStatusCtrl.reqStatus[index];

                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(reqStatus.medName),
                      subtitle: Column(
                        children: [
                          Text('Quantity Requested: ${reqStatus.quantity}'),
                          Text('Type: ${reqStatus.type}'),
                        ],
                      ),

                      // trailing: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     ElevatedButton(
                      //       child: Text('✔'),
                      //       onPressed: () {
                      //         globals.donorId =
                      //             reqStatusCtrl.reqStatus[index].id;
                      //         //_addAmount(context);
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //           primary: Colors.green),
                      //     ),
                      //     ElevatedButton(
                      //       child: Text('✖'),
                      //       onPressed: () {},
                      //       style:
                      //           ElevatedButton.styleFrom(primary: Colors.red),
                      //     ),
                      //   ],
                      // )
                    ),
                  );
                },
                itemCount: reqStatusCtrl.reqStatus.length,
              ),
            ),

          ///                       /////////////
          ////                      ////////////
          ///// Recieved case manage  ///////////
          if (_requestType == RequestType.pending)
            Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  reqStatus = reqStatusCtrl.reqStatus[index];

                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(reqStatus.medName),
                      subtitle: Column(
                        children: [
                          Text('Quantity Requested: ${reqStatus.quantity}'),
                          Text('Type: ${reqStatus.type}'),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: reqStatusCtrl.reqStatus.length,
              ),
            ),
        ],
      ),
    );
  }
}
