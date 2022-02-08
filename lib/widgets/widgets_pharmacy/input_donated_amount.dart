import 'package:flutter/material.dart';
import 'package:fyp_real/controller/date_time_picker.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

final _amountController = TextEditingController();

class InputDonatedAmount extends StatelessWidget {
  var wishId;
  var ngoid;
  var quantity;
  var type;
  var medName;
  DateTimePicker dateController = Get.put(DateTimePicker());
  InputDonatedAmount(wishlistId, ngoId, quant, typ, medNm) {
    wishId = wishlistId;
    ngoid = ngoId;
    quantity = quant;
    type = typ;
    medName = medNm;
  }
  @override

// void _submitData() {
//     if (_amountController.text.isEmpty) {
//       return;
//     }
//     final enteredTitle = _titleController.text;
//     final enteredQuantity = double.parse(_quantityController.text);

//     if (enteredTitle.isEmpty ||
//         enteredQuantity <= 0 ||
//         dateController.selectedDate == null) {
//       return;
//     }
//   }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 120,
            right: 100,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Obx(
                      () => Text(
                          'Expiry Date: ${DateTime.parse(dateController.selectedDate.toString())}'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => dateController.presentDatePicker(context),
                    child: Text(
                      'Select Expiry Date',
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Donation Amount',
                ),
                controller: _amountController,
                onSubmitted: (String line) => () {
                  print('object');
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: Text('Donate'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,

                  //onPrimary: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () {
                  PharmacyApiCalling().donateToAdmin(
                      globals.id,
                      wishId,
                      ngoid,
                      quantity,
                      type,
                      medName,
                      _amountController.text,
                      dateController.selectedDate);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
