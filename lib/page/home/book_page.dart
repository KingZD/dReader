import 'package:dreader/model/book_shop_menu.dart';
import 'package:dreader/page/home/item/d_reader_menu.dart';
import 'package:dreader/widget/bookshop/d_reader_search_button.dart';
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
  const BookPage({Key key}) : super(key: key);

  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<BookPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final _title = [
    "精选",
    "男生",
    "女生",
    "图书",
    "听书",
    "漫画",
    "VIP",
  ];

  final _menu = [
    BookShopMenu("", "榜单", "static/img/bangdan.png"),
    BookShopMenu("", "完本", "static/img/book_complete.png"),
    BookShopMenu("", "新书", "static/img/book_new.png"),
    BookShopMenu("", "精选", "static/img/book_chioce.png"),
    BookShopMenu("", "书单", "static/img/book_list.png"),
  ];

  final _recommend = [
    BookShopMenu("", "斗罗大陆",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01iHinAVKxh/LvskRCjyPy3bS3.jpg!l"),
    BookShopMenu("", "斗罗大陆外传：神界传说（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01r0xcGw6F9/g5aALVM5js6v5j.jpg!l"),
    BookShopMenu("", "斗破苍穹（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p010s07xjt4t/MmSF93H0dwqC1b.jpg!l"),
    BookShopMenu("", "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l"),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              ///避免布局被吃掉 屏幕显示pixel 错误提示
              DReaderTabViewInheritedWidget(
                tabs: _title,
                child: DReaderTabView(),
              ),
              DReaderSearchWidget(),
              DReaderMenuWidget(menus: _menu),
              DReaderMenuWidget(menus: _recommend),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
