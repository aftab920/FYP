import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: AlertDialog(
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Click'),
          ),
        ],
      ),
    );
  }
}
