import 'package:flutter/material.dart';
import 'package:my_app/chatRoom/chat_model.dart';
import 'package:my_app/chatRoom/bubble.dart';

class TextTile extends StatefulWidget {
  final int index;
  final ChatModel model;
  const TextTile(this.index, this.model, {super.key});

  @override
  State<TextTile> createState() => _ChatItemTile(index, model);
}

class _ChatItemTile extends State<TextTile> {
  final int index;
  final ChatModel model;

  _ChatItemTile(this.index, this.model);

  @override
  Widget build(BuildContext context) {
    final chatList = [];

    if (model == null) {
      return Container(
        color: Colors.green,
      );
    }

    final messageBubbleTile = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              model.text,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        CustomPaint(painter: CustomShape(Colors.cyan[900]!)),
      ],
    ));

    return GestureDetector(
      onTap: () => {print("点击聊天室列表index:${index}")},
      child: Padding(
        padding: EdgeInsets.all(4),
        // alignment: Alignment(-1, 0.0),
        // color: Colors.white,
        child: ChatBubble(
          model.side == 1 ? BubbleType.left : BubbleType.right,
          model.text,
          "",
          "",
          "",
        ),
      ),
    );
  }
}
