import 'package:flutter/material.dart';
// import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';
import 'package:my_app/chatRoom/chat_room.dart';

class Chats extends StatefulWidget {
  var _title;

  Chats(String title) {
    this._title = title;
  }

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  // _ChatDataSource? _dessertsDataSource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: 50,
        itemExtent: 80.0,
        controller: ScrollController(),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class _ChatData {
  _ChatData(
    this.name,
    this.calories,
    this.fat,
    this.carbs,
    this.protein,
    this.sodium,
    this.calcium,
    this.iron,
  );

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;
  bool selected = false;
}

// class _ChatDataSource extends DataTableSource {
//   late List<_ChatData> _chatDatas;
//   int _selectedCount = 0;

//   final format = NumberFormat.decimalPercentPattern(
//     locale: "123618",
//     decimalDigits: 0,
//   );

//   _ChatDataSource(this.context) {
//     _chatDatas = <_ChatData>[
//       _ChatData(
//         'andrew',
//         159,
//         6.0,
//         24,
//         4.0,
//         87,
//         14,
//         1,
//       ),
//       _ChatData(
//         'andrew',
//         305,
//         3.7,
//         67,
//         4.3,
//         413,
//         3,
//         8,
//       ),
//       _ChatData(
//         'andrew',
//         356,
//         16.0,
//         49,
//         3.9,
//         327,
//         7,
//         16,
//       ),
//       _ChatData(
//         'andrew',
//         375,
//         0.0,
//         94,
//         0.0,
//         50,
//         0,
//         0,
//       ),
//       _ChatData(
//         'andrew',
//         392,
//         0.2,
//         98,
//         0.0,
//         38,
//         0,
//         2,
//       ),
//       _ChatData(
//         'andrew',
//         408,
//         3.2,
//         87,
//         6.5,
//         562,
//         0,
//         45,
//       ),
//       _ChatData(
//         'andrew',
//         452,
//         25.0,
//         51,
//         4.9,
//         326,
//         2,
//         22,
//       ),
//       _ChatData(
//         'andrew',
//         518,
//         26.0,
//         65,
//         7.0,
//         54,
//         12,
//         6,
//       ),
//       _ChatData(
//         'andrew',
//         271,
//         16.0,
//         26,
//         6.0,
//         337,
//         6,
//         7,
//       ),
//       _ChatData(
//         'andrew',
//         301,
//         9.0,
//         49,
//         4.3,
//         129,
//         8,
//         1,
//       ),
//       _ChatData(
//         'andrew',
//         326,
//         16.0,
//         36,
//         6.0,
//         337,
//         6,
//         7,
//       ),
//       _ChatData(
//         'andrew',
//         369,
//         3.7,
//         79,
//         4.3,
//         413,
//         3,
//         8,
//       ),
//       _ChatData(
//         'andrew',
//         420,
//         16.0,
//         61,
//         3.9,
//         327,
//         7,
//         16,
//       ),
//       _ChatData(
//         'andrew',
//         439,
//         0.0,
//         106,
//         0.0,
//         50,
//         0,
//         0,
//       ),
//       _ChatData(
//         'andrew',
//         582,
//         26.0,
//         77,
//         7.0,
//         54,
//         12,
//         6,
//       ),
//     ];
//   }

//   @override
//   DataRow? getRow(int index) {
//     assert(index >= 0);
//     if (index >= _chatDatas.length) return null;
//     final chatItem = _chatDatas[index];
//     return DataRow.byIndex(
//       index: index,
//       selected: chatItem.selected,
//       onSelectChanged: (value) {
//         if (chatItem.selected != value) {
//           _selectedCount += value! ? 1 : -1;
//           assert(_selectedCount >= 0);
//           chatItem.selected = value;
//           notifyListeners();
//         }
//       },
//       cells: [
//         DataCell(Text(chatItem.name)),
//         DataCell(Text('${chatItem.calories}')),
//         DataCell(Text(chatItem.fat.toStringAsFixed(1))),
//         DataCell(Text('${chatItem.carbs}')),
//         DataCell(Text(chatItem.protein.toStringAsFixed(1))),
//         DataCell(Text('${chatItem.sodium}')),
//         DataCell(Text(format.format(chatItem.calcium / 100))),
//         DataCell(Text(format.format(chatItem.iron / 100))),
//       ],
//     );
//   }
//
//   @override
//   int get rowCount => _chatDatas.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => _selectedCount;
// }

class ChatPrototypeItem extends StatefulWidget {
  @override
  _ChatPrototypeItem createState() => _ChatPrototypeItem();
}

class _ChatPrototypeItem extends State<ChatPrototypeItem> {
  void _onItemTapped(int index) {
    print("jojo");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        print("12345678");
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  void _onItemTapped(BuildContext context, int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatRoom("昵称")));
  }

  @override
  Widget build(BuildContext context) {
    final chatList = <_ChatData>[];

    final isOdd = itemNo % 2 == 1;
    return GestureDetector(
      onTap: () => {
        print("点击item"),
        _onItemTapped(context, itemNo),
      },
      child: Container(
        alignment: Alignment(-1, 0.0),
        color: isOdd ? Colors.white : Color(0xFFEAEAEA),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Image(
                image: NetworkImage(
                    "https://ts1.cn.mm.bing.net/th/id/R-C.9f00e054b22ea739eeee3af7d4379ac8?rik=cdt%2fnGN5NNGy9A&riu=http%3a%2f%2fimg.mm4000.com%2ffile%2fa%2f08%2f52830774b5.jpg&ehk=bc0uHlkDOnAScAJ6B4sP5FdW7bKal4MRvLUJmUQNOYs%3d&risl=&pid=ImgRaw&r=0"), //AssetImage("images/image.jpg"),
                width: 44.0,
                height: 44.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    "昵称",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        backgroundColor: Colors.yellow),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Text(
                    "最新消息",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
