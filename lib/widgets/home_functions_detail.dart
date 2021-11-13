import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFunctionsDetail extends StatelessWidget {
  final List data;
  HomeFunctionsDetail({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${data[0].toString()}'),
        ),
        body: Text('data')
        //  Column(
        //   children: [
        //     if()
        //   ],
        // ),
        );
  }
}
