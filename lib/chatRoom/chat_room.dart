// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'dart:io';
import 'package:flutter/services.dart';
import 'package:my_app/chatRoom/chat_model.dart';
import 'package:my_app/chatRoom/text_tile.dart';
// import 'package:my_app/chatRoom/emoj_tile.dart';
// import 'package:my_app/chatRoom/image_tile.dart';
// import 'package:my_app/chatRoom/video_tile.dart';
import 'package:my_app/web_socket_util.dart';

import 'keyboard.dart';

class ChatRoom extends StatefulWidget {

  final String title;

  const ChatRoom(this.title, {super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChatRoomState();
  }
}

class _ChatRoomState extends State<ChatRoom> {
  
  // final TextEditingController _controller = TextEditingController();
  double screen_width = 0;
  double screen_height = 0;

  var devicePixelRatio = 0.0;

  Future<List<ChatModel>> getChatModels() async {
    final jsonString = await rootBundle.loadString("local_files/test.txt");

    //2.转成List或Map类型
    final jsonResult = jsonDecode(jsonString);

    List<ChatModel> cts = [];
    for (Map<String, dynamic> map in jsonResult) {
      cts.add(ChatModel.fromJson(map));
    }
    return cts;
  }

  List<ChatModel> cts = [];

  disposeData() {
    Future<List<ChatModel>> list = getChatModels();
    list.then((value) => {
          setState(() => {
              print("数据加载成功1111"),
                cts = value,
              }),
          print("数据量:$cts"),
        })
        .whenComplete(() => print("数据量111:$cts")
        );
  }

  Widget getList_tile(int index) {
    if (cts.isEmpty) {
      ChatModel model = cts[index];
      if (model.msgType == 1) {
        return TextTile(index, model);
      } else if (model.msgType == 2) {
        return TextTile(index, model);
      } else if (model.msgType == 2) {
        return TextTile(index, model);
      } else {
        return TextTile(index, model);
      }
    } else {
      return Container();
    }
  }

  void sendMessage(data) {
    WebSocketUtility.socket.sendMessage(data);
  }

  @override
  void initState() {
    super.initState();
    disposeData();
  }

  @override
  Widget build(BuildContext context) {

    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    
    print("屏幕宽度:${screen_width / 3.0},屏幕高度:${screen_height / 3.0}");
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.green,
                      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
                      // height: screen_height / devicePixelRatio - 88 - 88,
                      child: SafeArea(
                        child: ListView.builder(
                          itemCount: cts.length,
                          // itemExtent: 80.0,
                          controller: ScrollController(),
                          itemBuilder: (context, index) => TextTile(
                            index,
                            cts[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 88,
                      child: ChatInput(sendMessage),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
