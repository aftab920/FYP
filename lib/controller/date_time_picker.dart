import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DateTimePicker extends GetxController {
  var selectedDate = DateTime.now().obs;
  var allowedDate = DateTime.now();
  // var allowedDate2 =
  //     new

  void presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate:
          DateTime(allowedDate.year, allowedDate.month + 3, allowedDate.day),
      firstDate:
          DateTime(allowedDate.year, allowedDate.month + 3, allowedDate.day),
      lastDate: DateTime(2035),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate.value = pickedDate;
    });
    print('...');
  }
}
