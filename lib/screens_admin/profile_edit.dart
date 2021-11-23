import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            child: CircleAvatar(
              radius: 10.0,
              //backgroundImage: ,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/Profile_Image.jpg',
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(70.0),
              ),
            ),
          ),
          // Card(
          //   child: ListTile(),
          // )
        ],
      ),
    );
  }
}
