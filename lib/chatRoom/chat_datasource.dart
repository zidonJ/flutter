import 'package:flutter/material.dart';
import 'package:my_app/chatRoom/chat_model.dart';
import 'package:my_app/chatRoom/text_tile.dart';

class ChartRoomDataSource extends DataTableSource {
  int _selectCount = 0; //当前选中的行数
  var chat_models = <ChatModel>[];
  var chat_cells = <DataCell>[];
  ChartRoomDataSource(this.chat_models) {
    chat_models.map((value, {index}) => {
          chat_cells.add(DataCell(Container(
            child: TextTile(index, chat_models[index]),
          )))
        });
  }
  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
    return DataRow.byIndex(
      cells: chat_cells,
      index: index,
    );
  }

  @override //是否行数不确定
  bool get isRowCountApproximate => false;

  @override //有多少行
  int get rowCount {
    return chat_models.length;
  }

  @override //选中的行数
  int get selectedRowCount => _selectCount;
}
