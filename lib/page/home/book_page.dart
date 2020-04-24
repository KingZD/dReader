import 'dart:math';

import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/widget/tabber/d_reader_tab.dart';
import 'package:dreader/widget/tabber/d_reader_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ScrollDirect {
  ///向左滑动
  LEFT,

  ///向右滑动
  RIGHT,

  /// 停止
  AIDL
}

/**
 * Author: zed
 * Date: 2020/4/23 11:37
 * Description: 书城
 */
class BookPage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<BookPage> with TickerProviderStateMixin {
  final _title = [
    "精选",
    "男生",
    "女生",
    "图书",
    "听书",
    "漫画",
    "VIP",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              ///避免布局被吃掉 屏幕显示pixel 错误提示
              DReaderTabViewInheritedWidget(
                tabs: _title,
                child: DReaderTabView(),
              ),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: PageController(),
                  children: _title
                      .map((item) => Container(
                            child: Text(item),
                            margin: EdgeInsets.all(12),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
