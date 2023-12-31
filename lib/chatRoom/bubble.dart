import 'package:flutter/material.dart';
import 'dart:math' as math;
// import 'package:my_app/chatRoom/direct_triangle.dart';

enum BubbleType { left, right }

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(7, 20);
    path.lineTo(0, 15);
    path.lineTo(0, 25);
    path.lineTo(7, 20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ChatBubble extends StatelessWidget {
  final BubbleType type;
  final String text;
  final String image_url;
  final String video_url;
  final String autio_url;

  ChatBubble(this.type,this.text,this.image_url,this.video_url,this.autio_url,{super.key});
  // ChatBubble(this.type, String? text, String? image_url, String? video_url,
  //     String? autio_url) {
  //   this.type = type;
  //   this.text = text;
  //   this.image_url = image_url;
  //   this.video_url = video_url;
  //   this.autio_url = autio_url;
  // }
  @override
  Widget build(BuildContext context) {
    if (type == BubbleType.left) {
      return LeftChatBubble(text);
    } else {
      return RightChatBubble(text);
    }
  }
}

class LeftChatBubble extends StatelessWidget {
  final String message;
  const LeftChatBubble(this.message);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: CustomShape(Colors.grey[300]!),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ],
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 18, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}

class RightChatBubble extends StatelessWidget {
  final String message;
  final Color cyan = Colors.cyan[900]!;
  RightChatBubble(this.message,{super.key});
  
  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        CustomPaint(painter: CustomShape(cyan)),
      ],
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 50, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
