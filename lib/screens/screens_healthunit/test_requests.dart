import 'package:flutter/material.dart';

enum RequestType { pending, issued, recieved }

class TestRequests extends StatefulWidget {
  @override
  State<TestRequests> createState() => _TestRequestsState();
}

class _TestRequestsState extends State<TestRequests> {
  RequestType _requestType = RequestType.pending;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Requests'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('pending'),
              Radio(
                value: RequestType.pending,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                    },
                  );
                },
              ),
              Text('Issued'),
              Radio(
                value: RequestType.issued,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                    },
                  );
                },
              ),
              Text('Recieved'),
              Radio(
                value: RequestType.recieved,
                groupValue: _requestType,
                onChanged: (val) {
                  setState(
                    () {
                      print(val);
                      _requestType = val as RequestType;
                    },
                  );
                },
              ),
            ],
          ),
          if (_requestType == RequestType.pending)
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('C-1'),
            ),
          if (_requestType == RequestType.issued)
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('C-2'),
            ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('C-Special'),
          ),
          if (_requestType == RequestType.recieved)
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('C-3'),
            ),
        ],
      ),
    );
  }
}
