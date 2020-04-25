import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/navigator_utils.dart';
import 'package:dreader/page/home/book_page.dart';
import 'package:dreader/widget/fixed_tab_bar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {
  static String sName = "HomePage";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    // TODO: implement createState
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

  ///tab 控制器
  TabController _tabController;
  PageController _pageController = new PageController();

  ///当前选中的tab
  var _currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation.value) {
//        _changeTabIndex(_tabController.index);
      }
    });
  }

  _changeTabIndex(index){
    setState(() {
      _currentTabIndex = index;
    });
    print(_currentTabIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FixedTabBarView(
        tabController: _tabController,
        pageController: _pageController,
        children: <Widget>[
          BookPage(),
          ListView(),
          ListView(),
          ListView(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 0.0,
                  style: BorderStyle.solid,
                  color: DReaderColors.subTextColor)),
        ),
        /// 底部菜单栏
        child: SafeArea(
          child: TabBar(
            onTap: (index){
//              _changeTabIndex(index);
              _pageController.jumpToPage(index);
              print("=>$index");
            },
            controller: _tabController,
            tabs: tabs
                .map((item) => Column(
              children: <Widget>[
                Image.asset(
                  item[_currentTabIndex == tabs.indexOf(item)
                      ? "icon_p"
                      : "icon_n"],
                  height: 35,
                ),
                Text(
                  item["tab"],
                  style: TextStyle(
                      fontSize: 10,
                      color: _currentTabIndex == tabs.indexOf(item)
                          ? DReaderColors.mainThemeColor
                          : Colors.black54),
                )
              ],
            ))
                .toList(),
            indicatorColor: DReaderColors.white,
          ),
        ),
      ),
    );
  }
}
