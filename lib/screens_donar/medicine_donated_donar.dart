import 'package:flutter/material.dart';

class MedicineDonateDonar extends StatefulWidget {
  @override
  State<MedicineDonateDonar> createState() => _MedicineDonateDonarState();
}

class _MedicineDonateDonarState extends State<MedicineDonateDonar> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Donated Medicines'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('Donated To: De-Watson'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),

                  Text('Quantity: 6'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('Donated To: Edhi'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Quantity: 76'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('Donated To: Ahmad'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Quantity: 18'),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Remove',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
