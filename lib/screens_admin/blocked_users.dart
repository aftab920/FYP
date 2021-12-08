import 'package:flutter/material.dart';

class BlockedUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('De-Watson'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: info@dewatson.com'),
                  Text('Phone: 0302690'),
                ],
              ),
              leading: Icon(Icons.person),
              trailing:
                  ElevatedButton(onPressed: () {}, child: Text('Unblock')),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('Edhi'),
              leading: Icon(Icons.person),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: info@edhi.com'),
                  Text('Phone: 0302661'),
                ],
              ),
              trailing:
                  ElevatedButton(onPressed: () {}, child: Text('Unblock')),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('Ahmad'),
              leading: Icon(Icons.person),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ahmad@gmail.com'),
                  Text('Phone: 0302600009'),
                ],
              ),
              trailing:
                  ElevatedButton(onPressed: () {}, child: Text('Unblock')),
            ),
          ),
        ],
      ),
    );
  }
}
