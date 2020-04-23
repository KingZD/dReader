import 'dart:collection';
import 'dart:math';

import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/widget/tabber/d_reader_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  //
  final _mDefaultTabWidth = 50.0;
  final _mDefaultHeight = 30.0;
  var _mTabIndex = 0;
  ScrollController _scrollController = new ScrollController();
  List<AnimationController> _animationControllers = new List();
  List<GlobalKey<DReaderTabState>> _mGBK = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //长度和标题一样
    _animationControllers.length = _title.length;
    _title.forEach((item) {
      GlobalKey<DReaderTabState> gbk = GlobalKey<DReaderTabState>();
      _mGBK.add(gbk);
    });

    _scrollController.addListener(() {
//      print(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  ///tab底线
  Widget _tabLine({bool show}) {
    show = show ?? true;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: <Color>[
            show ? DReaderColors.mainThemeColor : Colors.transparent,
            show ? DReaderColors.mainThemeColor : Colors.transparent
          ])),
      child: SizedBox(
        height: 3,
        width: 15,
      ),
    );
  }

  ///判断是否点击的当前tab
  bool _isCurrentTab(item) {
    return _mTabIndex == _tabIndex(item);
  }

  int _tabIndex(item) {
    return _title.indexOf(item);
  }

  void _changeTab(index) {
    setState(() {
      _mTabIndex = index;
    });
  }

  void _registerAnimation(index) {
    _animationControllers[index] = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this,
        lowerBound: DReaderConstant.middleTextWhiteSize,
        upperBound: DReaderConstant.textSize_20);
  }

  void _execAnimation() {
    _animationControllers.forEach((item) => {{}});
    for (var i = 0; i < _animationControllers.length; i++) {
      final item = _animationControllers[i];
      item?.addListener(() {
        print(_mGBK[i]);
        if (item.value == item.upperBound) _animationControllers[i] = null;
        _mGBK[i]?.currentState?.changeSize(item.value);
      });
      item?.reset();
      item?.forward();
    }
  }

  ///tabbar容器
  Widget _tabBarView() {
    return Builder(
      builder: (BuildContext rootContext) {
        return SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),

          ///控制横向滑动
          scrollDirection: Axis.horizontal,
          child: Builder(builder: (BuildContext childrenContext) {
            return Row(
              ///控制内容整体底部对齐
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _title
                  .map((item) => GestureDetector(
                        onTap: () {
                          final index = _tabIndex(item);
//                          rootContext.size.width
//                          rootContext.findRenderObject().semanticBounds.width
//                          rootContext.findRenderObject().paintBounds.width
                          final mRootViewWidth = rootContext.size.width;
                          final mChildrenWidth = childrenContext.size.width;

                          final mNeedScrollOffset =
                              mChildrenWidth - mRootViewWidth;
                          double scrollWidth = 0;

                          ///点击第一个tab 不需要滚动效果
                          if (index == 0) {
                            scrollWidth = 0;
                          } else if (index != _mTabIndex &&
                                  index == _title.length - 1 ||
                              index == _title.length - 1 &&
                                  scrollWidth != mNeedScrollOffset) {
                            ///点击最后个tab 滚动距离为超出屏幕的距离
                            scrollWidth = mNeedScrollOffset;
                          } else {
                            ///中间滚动的距离为 mNeedScrollOffset/title.length*index 的距离
                            scrollWidth = mNeedScrollOffset /
                                _title.length *
                                (index + 0.6);
                          }
                          _scrollController.animateTo(scrollWidth,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);

                          ///点击tab
                          _changeTab(index);
                          _registerAnimation(index);
                          _execAnimation();
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          constraints: BoxConstraints(
                              minWidth: _mDefaultTabWidth,
                              minHeight: _mDefaultHeight),
                          child: _tabView(item),
                        ),
                      ))
                  .toList(),
            );
          }),
        );
      },
    );
  }

  ///tab组件
  Widget _tabView(item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Builder(
          key: UniqueKey(),
          builder: (BuildContext context) {
            double defaultSize = DReaderConstant.middleTextWhiteSize;
            return DReaderTab(
              text: item,
              isCurrentTab: _isCurrentTab(item),
              key: _mGBK[_tabIndex(item)],
            );

//            return Text(
//              item,
//              style: TextStyle(
//                  color: _isCurrentTab(item) ? Colors.black : Colors.black87,
//                  fontWeight:
//                      _isCurrentTab(item) ? FontWeight.w600 : FontWeight.normal,
//                  fontSize: _isCurrentTab(item)
//                      ? _animationControllers[_tabIndex(item)]?.value ??
//                      defaultSize
//                      : defaultSize
//            fontSize: _isCurrentTab(item)
//                ? DReaderConstant.textSize_20
//                : DReaderConstant.middleTextWhiteSize,
//                  ),
//            );
          },
        ),
        _tabLine(show: _isCurrentTab(item))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: _SliverPersistentHeaderDelegate(
                    child: Text("www"), minHeight: 20, maxHeight: 0),
              ),

              ///书城tab栏目
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    ///避免布局被吃掉 屏幕显示pixel 错误提示
                    Expanded(
                      child: Stack(
                        children: <Widget>[_tabBarView(), _tabLine()],
                      ),
                    ),
                    Container(
                      height: _mDefaultHeight,
                      width: _mDefaultTabWidth,
                      color: Colors.transparent,
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
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

///悬浮组件
class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate(
      {@required this.child, this.maxHeight, @required this.minHeight});

  final Widget child;
  final double maxHeight;
  final double minHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight > minHeight ? maxHeight : minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
