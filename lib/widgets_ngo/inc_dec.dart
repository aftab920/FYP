import 'dart:async';

import 'package:flutter/material.dart';

class IncDec extends StatefulWidget {
  @override
  _IncDecState createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {
  final _controller = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    _sink.add(initValue);
    _stream.listen((event) => _controller.text = event.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      _sink.add(--initValue);
                    },
                    child: Icon(Icons.remove)),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _sink.add(++initValue);
                    },
                    child: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    _controller.dispose();
    super.dispose();
  }
}
