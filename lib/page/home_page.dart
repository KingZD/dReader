import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/navigator_utils.dart';
import 'package:dreader/page/book/book_shelf_page.dart';
import 'package:dreader/page/home/book_page.dart';
import 'package:dreader/page/type/type_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String sName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _HomePage(key: PageStorageKey(sName)),
      onWillPop: () {
//        return NavigatorUtils.goBackHomeDeskTop(context);
        return NavigatorUtils.doubleClickExit(context);
      },
    );
  }
}

class _HomePage extends StatefulWidget {
  _HomePage({Key key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<_HomePage> with SingleTickerProviderStateMixin {
  final tabs = [
    {
      "tab": "书城",
      "icon_n": "static/img/surfing__surfing_navigate_view__store_n.png",
      "icon_p": "static/img/surfing__surfing_navigate_view__store_p.png"
    },
    {
      "tab": "分类",
      "icon_n": "static/img/surfing__surfing_navigate_view__category_n.png",
      "icon_p": "static/img/surfing__surfing_navigate_view__category_p.png"
    },
    {
      "tab": "书架",
      "icon_n": "static/img/surfing__surfing_navigate_view__bookshelf_n.png",
      "icon_p": "static/img/surfing__surfing_navigate_view__bookshelf_p.png"
    },
    {
      "tab": "我的",
      "icon_n": "static/img/surfing__surfing_navigate_view__personal_n.png",
      "icon_p": "static/img/surfing__surfing_navigate_view__personal_p.png"
    }
  ];

  ///当前选中的tab
  var _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  _changeTabIndex(index) {
    setState(() {
      _currentTabIndex = index;
    });
    print(_currentTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTabIndex,
        children: <Widget>[
          BookPage(),
          TypePage(),
          BookShelfPage(),
          ListView(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        inactiveColor: Colors.black54,
        activeColor: DReaderColors.mainThemeColor,
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _changeTabIndex(index);
          });
        },
        items: tabs
            .map((item) => BottomNavigationBarItem(
                icon: getTabIcon(tabs.indexOf(item)), title: getTabTxt(tabs.indexOf(item))))
            .toList(),
      ),
    );
  }

  Image getTabIcon(int index) {
    return Image.asset(
      tabs[index][_currentTabIndex == index ? "icon_p" : "icon_n"],
      height: 35,
    );
  }

  Text getTabTxt(int index) {
    return Text(
      tabs[index]["tab"],
    );
  }
}
