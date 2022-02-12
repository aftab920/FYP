import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:get/get.dart';

class ViewCash extends StatefulWidget {
  @override
  State<ViewCash> createState() => _ViewCashState();
}

class _ViewCashState extends State<ViewCash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Cash"),
      ),
      body: FutureBuilder(
        future: PharmacyApiCalling().getCash(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        'Total Donation Amount: ${snapshot.data[0]}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width * 0.1),
                        right: (MediaQuery.of(context).size.width * 0.1),
                        bottom: (MediaQuery.of(context).size.width * 0.3)),
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                    child: Text(
                      'Remaining Donation Amount: ${snapshot.data[1]}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    color: Colors.cyan,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
