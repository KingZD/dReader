import 'package:dreader/page/me/d_me_operate_cell.dart';
import 'package:flutter/material.dart';

class DReaderMeOperate extends StatefulWidget {
  @override
  _DReaderMeOperate createState() {
    return _DReaderMeOperate();
  }
}

class _DReaderMeOperate extends State<DReaderMeOperate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "实用功能",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_reading_history_icon.png",
            title: "阅历",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_shopping_cart_icon.png",
            title: "购物车",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_purchased_upload_icon.png",
            title: "已购和上传",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_books_list_icon.png",
            title: "书单",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_fav_books_icon.png",
            title: "想读",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_idea_icon.png",
            title: "想法",
          ),
          DReaderMeOperateCell(
            icon:
                "static/img/personal__main__practical_function_award_icon.png",
            title: "奖品",
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
    );
  }
}
