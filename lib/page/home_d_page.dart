import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/navigator_utils.dart';
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

  ///当前选中的tab
  var _currentTabIndex = 0;

  var _currentTapIndex = -1;

  var _cacheCurrentTapIndex = -1;

  @override
  void initState() {
    print("initState");
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation.value) {
        _changeTabIndex(_tabController.index);
      }
    });
  }

  _changeTabIndex(index){
    setState(() {
      _currentTabIndex = index;
    });
    print(_currentTabIndex);
  }

  _changeTapIndex(index){
    setState(() {
      _currentTapIndex = index;
    });
    print(_currentTapIndex);
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text("sss"),
          ),
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
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((item) => GestureDetector(
                      onTapDown: (detail) {
                        print("onTapDown");
                        _cacheCurrentTapIndex = tabs.indexOf(item);
                        _changeTapIndex(_cacheCurrentTapIndex);
                      },
                      onTap: () {
                        _changeTabIndex(_cacheCurrentTapIndex);
                      },
                      onTapCancel: () {
                        _changeTapIndex(_currentTabIndex);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            item[_currentTabIndex == tabs.indexOf(item) ||
                                    tabs.indexOf(item) == _currentTapIndex
                                ? "icon_p"
                                : "icon_n"],
                            height: 35,
                          ),
                          Text(
                            item["tab"],
                            style: TextStyle(
                                fontSize: 10,
                                color: _currentTabIndex == tabs.indexOf(item) ||
                                        tabs.indexOf(item) == _currentTapIndex
                                    ? Color.fromARGB(255, 253, 150, 40)
                                    : Colors.black54),
                          )
                        ],
                      ),
                    ))
                .toList(),
            indicatorColor: DReaderColors.white,
          ),
        ),
      ),
    );
  }
}
