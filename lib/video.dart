import 'package:flutter/material.dart';

class WatchVideos extends StatefulWidget {
  var _title;

  WatchVideos(String title) {
    this._title = title;
  }

  @override
  State<WatchVideos> createState() => _WatchVideos();
}

class _WatchVideos extends State<WatchVideos> {
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
