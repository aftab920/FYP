import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFunctionsItem extends StatelessWidget {
  final String id;
  final String title;
  final Icon icon;

  MainFunctionsItem(
    this.id,
    this.title,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            Expanded(
              child: icon,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black12,
        ),
      ),
    );
  }
}
