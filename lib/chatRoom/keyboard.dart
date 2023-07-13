import 'package:flutter/material.dart';
import 'package:my_app/chatRoom/window_util.dart';

class ChatInput extends StatefulWidget {
  Function sendCall;
  ChatInput(this.sendCall, {super.key});

  @override
  State<ChatInput> createState() => _ChatInput();
}

class _ChatInput extends State<ChatInput> {
  var devicePixelRatio = 0.0;
  final TextEditingController _controller = TextEditingController();
  //键盘焦点
  final FocusNode focusNode = FocusNode();
  FocusScopeNode? focusScopeNode;

  void sendMessage(data) {
    widget.sendCall(data);
  }

  @override
  Widget build(BuildContext context) {
    print(
        "屏幕宽度:${WindowHelper.screen_width / 3.0},屏幕高度:${WindowHelper.screen_height / 3.0}");
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextButton(
                onPressed: () {
                  print("点击图片按钮");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(30, 30)),
                  alignment: const Alignment(-1.0, 1.0),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    image: AssetImage("images/voice.jpg"),
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   border: Border.all(color: Colors.grey, width: 1.0),
              //   borderRadius: BorderRadius.all(Radius.circular(5)),
              // ),
              height: 40.0,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextField(
                      ///是否可编辑
                      enabled: true,

                      ///焦点获取
                      focusNode: focusNode,
                      autofocus: false,
                      controller: _controller,

                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        fillColor: Colors.green,
                        labelStyle: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.red,
                            style: BorderStyle.solid,
                          ),
                        ),
                        prefixIcon: SizedBox(width: 8.0),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 8.0,
                          maxWidth: 8.0,
                          minHeight: 5,
                          maxHeight: 5,
                        ),
                        suffixIcon: SizedBox(width: 8.0),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 8.0,
                          maxWidth: 8.0,
                          minHeight: 5,
                          maxHeight: 5,
                        ),

                        ///设置输入框可编辑时的边框样式
                        enabledBorder: OutlineInputBorder(
                          ///设置边框四个角的弧度
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                          ///用来配置边框的样式
                          borderSide: BorderSide(
                            ///设置边框的颜色
                            color: Colors.red,

                            ///设置边框的粗细
                            width: 2.0,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          ///设置边框四个角的弧度
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                          ///用来配置边框的样式
                          borderSide: BorderSide(
                            ///设置边框的颜色
                            color: Colors.red,

                            ///设置边框的粗细
                            width: 2.0,
                          ),
                        ),

                        ///用来配置输入框获取焦点时的颜色
                        focusedBorder: OutlineInputBorder(
                          ///设置边框四个角的弧度
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                          ///用来配置边框的样式
                          borderSide: BorderSide(
                            ///设置边框的颜色
                            color: Colors.green,

                            ///设置边框的粗细
                            width: 2.0,
                          ),
                        ),
                      ),
                      onSubmitted: (text) {
                        sendMessage(text);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print("表情");
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0x00000000)),
              overlayColor: MaterialStateProperty.all(const Color(0x00000000)),
              minimumSize: MaterialStateProperty.all<Size>(const Size(30, 30)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const Image(
                image: AssetImage("images/emo.jpg"),
                width: 30,
                height: 30,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print("更多功能 ");
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0x00)),
              overlayColor: MaterialStateProperty.all(const Color(0x00)),
              minimumSize: MaterialStateProperty.all<Size>(const Size(30, 30)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const Image(
                image: AssetImage("images/add.jpg"),
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
