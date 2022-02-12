import 'package:flutter/material.dart';
import 'package:fyp_real/controller/healthUnit_controller/healthUnit_api_calling.dart';
import 'package:fyp_real/controller/healthUnit_controller/med_requests_controller.dart';
import 'package:fyp_real/controller/healthUnit_controller/received_med_controller.dart';
import 'package:fyp_real/model/health_unit_model/receive_med_model.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

enum RequestType { pending, issued, recieved }

class MedRequestsStatus extends StatefulWidget {
  @override
  _MedRequestsStatusState createState() => _MedRequestsStatusState();
}

class _MedRequestsStatusState extends State<MedRequestsStatus> {
  late RequestType _requestType;
  var reqStatus;
  late MedRequestsStatusController reqStatusCtrl;
  late ReceivedMedController recMedCtrl;
  @override
  void initState() {
    _requestType = RequestType.pending;
    reqStatusCtrl = Get.put(MedRequestsStatusController());
    recMedCtrl = Get.put(ReceivedMedController());
    HUApiCalling().getMedicineRequestsStatus(RequestType.pending);
    super.initState();
  }

  void fetchStatusRelatedData(val) {
    HUApiCalling().getMedicineRequestsStatus(val);
  }

  DateTime dateConversion(date) {
    return DateTime.parse(date);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Status'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              Text('Pending', style: Theme.of(context).textTheme.subtitle1),
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
              Text('Issued', style: Theme.of(context).textTheme.subtitle1),
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
              Text('Recieved', style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ///                       /////////////
                ////                      ////////////
                ///// Issued case manage  ///////////
                if (_requestType == RequestType.issued)
                  Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        reqStatus = reqStatusCtrl.reqStatus[index];

                        return Card(
                          elevation: 5,
                          child: ListTile(
                              leading: Icon(Icons.medication),
                              title: Text(reqStatus.medName),
                              subtitle: Column(
                                children: [
                                  Text(
                                      'Quantity Issued: ${reqStatus.quantity}'),
                                  Text('Type: ${reqStatus.type}'),
                                ],
                              ),
                              trailing: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    child: Text('✔'),
                                    onPressed: () {
                                      globals.donorId =
                                          reqStatusCtrl.reqStatus[index].ngoId;
                                      HUApiCalling()
                                          .confirmReceived(reqStatus.stockId);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                  ),
                                  ElevatedButton(
                                    child: Text('✖'),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
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
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        reqStatus = reqStatusCtrl.reqStatus[index];

                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.medication),
                            title: Text(reqStatus.medName),
                            subtitle: Column(
                              children: [
                                Text(
                                    'Quantity Requested: ${reqStatus.quantity}'),
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
                if (_requestType == RequestType.recieved)
                  Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        reqStatus = recMedCtrl.reqStatus[index];
                        var date = dateConversion(reqStatus.expiry);

                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.medication),
                            title: Text(reqStatus.medName),
                            subtitle: Column(
                              children: [
                                Text(
                                    'Recieved Quantity: ${reqStatus.quantity}'),
                                Text('Type: ${reqStatus.type}'),
                                Text(
                                    'Expiry: ${date.day}-${date.month}-${date.year}')
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: recMedCtrl.reqStatus.length,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
