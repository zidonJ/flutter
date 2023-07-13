import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  var _title;

  Mine(String title) {
    this._title = title;
  }

  @override
  _mine createState() => _mine();
}

class _mine extends State<Mine> {
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

class PageHome extends StatefulWidget {
  String _title;

  PageHome(this._title);

  @override
  _PageHomeState createState() => _PageHomeState();
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
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
