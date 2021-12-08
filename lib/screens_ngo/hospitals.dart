import 'package:flutter/material.dart';

class Hospitals extends StatefulWidget {
  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals'),
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
              title: Text('PIMS'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@pims.com'),
                  Text('Phone: 0302690'),
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
              title: Text('Childrens Hospital'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@ch.com'),
                  Text('Phone: 0302661'),
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
              title: Text('Shokat Khanum'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@SKM.com'),
                  Text('Phone: 0302600009'),
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
