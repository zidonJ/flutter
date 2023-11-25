import 'package:flutter/material.dart';

class WatchVideos extends StatefulWidget {
  final String _title;

  WatchVideos(this._title,{super.key});

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
