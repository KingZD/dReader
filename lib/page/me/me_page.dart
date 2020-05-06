import 'package:dreader/model/book_shop_menu.dart';
import 'package:dreader/page/me/d_me_activity.dart';
import 'package:dreader/page/me/d_me_header.dart';
import 'package:dreader/page/me/d_me_opreate.dart';
import 'package:dreader/widget/d_line.dart';
import 'package:dreader/widget/d_reader_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MePage extends StatefulWidget {
  @override
  _MePage createState() {
    return _MePage();
  }
}

class _MePage extends State<MePage> {
  final _menu = [
    BookShopMenu(
        "", "签到", "static/img/personal__main__user_info_sign_in_icon.png"),
    BookShopMenu(
        "", "历史", "static/img/personal__main__user_info_history_icon.png"),
    BookShopMenu(
        "", "任务", "static/img/personal__main__user_info_task_icon.png"),
    BookShopMenu(
        "", "消息", "static/img/personal__main__user_info_message_icon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            child: Column(
              children: <Widget>[
                DReaderMeHeader(),
                SizedBox(
                  height: 20,
                ),
                DReaderMenuWidget(
                  menus: _menu,
                ),
                const DReaderLine(
                  color: Color(0xFFC8E6C9),
                  height: 1,
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                DReaderMeActivity(),
                const DReaderLine(
                  color: Color(0xFFC8E6C9),
                  height: 1,
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                DReaderMeOperate(),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                    "static/img/personal__main__header_view_qr_login_icon.png"),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                    "static/img/personal__main__header_view_dark_mode_icon.png"),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                    "static/img/personal__main__header_view_setting_icon.png"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
