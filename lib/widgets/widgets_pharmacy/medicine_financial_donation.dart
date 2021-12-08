import 'package:flutter/material.dart';

final _amountController = TextEditingController();
bool _pharmacyFlag = false;

class MedicineFinancialDonation extends StatelessWidget {
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
