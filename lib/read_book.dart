import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  var _title;

  ReadBook(String title) {
    this._title = title;
  }

  @override
  State<ReadBook> createState() => _Readbook();
}

class _Readbook extends State<ReadBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
