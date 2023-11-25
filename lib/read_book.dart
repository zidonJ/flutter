import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  final String _title;

  ReadBook(this._title,{super.key});

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
