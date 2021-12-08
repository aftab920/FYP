import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
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
              title: Text('De-Watson'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@dewatson.com'),
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
              title: Text('Edhi'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@edhi.com'),
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
              title: Text('Ahmad'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: ahmad@gmail.com'),
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
