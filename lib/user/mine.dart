// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  final String _title;

  const Mine(this._title, {super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _Mine();
  }
}

class _Mine extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(
          '${widget._title}内容',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class PageHome extends StatefulWidget {
  final String _title;

  const PageHome(this._title, {super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _PageHomeState();
  }
}


