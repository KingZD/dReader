import 'package:flutter/cupertino.dart';

/**
 * Author: zed
 * Date: 2020/4/24 21:06
 * Description: 提取tabview
 */
import 'dart:math';

import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/widget/tabber/d_reader_tab.dart';
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

class DReaderTabView extends StatelessWidget {
  final List<String> tabs;

  const DReaderTabView({
    Key key,
    @required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DReaderTabViewInheritedWidget(
      child: _DReaderTabWidget(),
      tabs: tabs,
    );
  }
}

class _DReaderTabWidget extends StatefulWidget {
  const _DReaderTabWidget({Key key}) : super(key: key);

  @override
  _DReaderTabView createState() {
    return _DReaderTabView();
  }
}

class _DReaderTabView extends State<_DReaderTabWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ///默认的tab宽度
  final _mDefaultTabWidth = 60.0;

  ///默认的tab高度
  final _mDefaultTabHeight = 35.0;

  ///默认的tab底线宽度
  final _mDefaultTabLineWidth = 12.0;

  ///默认的tab底线高度
  final _mDefaultTabLineHeight = 3.0;

  var _mScrollDirect = ScrollDirect.AIDL;

  ///当前选中的tab
  var _mTabIndex = 0;

  ///缓存上次选中的tab
  var _mCacheTabIndex = 0;

  ///底线滚动的位置
  var _mLineScrollWidth = 0.0;

  ///滚动监听
  ScrollController _scrollController = new ScrollController();

  ///底部线条动画监听
  AnimationController _lineAnimationController;

  ///tab对应的动画
  Map<int, AnimationController> _animationControllers = Map();

  ///多个tab 选中时显示的文本大小
  Map<int, double> _mTabTxtSize = {};

  ///多个tab 未选中时文本的大小
  Map<int, double> _mDefaultTabTxtSize = {};

  ///默认选中tab文本大小
  final _mUpperBound = DReaderConstant.bigTextSize;

  ///默认未选中tab文本大小
  final _mLowerBound = DReaderConstant.middleTextWhiteSize;

  ///scroll容器偏移量
  double _mScrollWidth = 0;

  ///点击tab时触发的滚动是否停止 true 未停止  false 已停止
  bool _mTapScroll = false;

  @override
  void initState() {
    print("_mTabIndex:$_mTabIndex");
    print("_mTabIndex:$_mScrollWidth");
    super.initState();
    final initLinePosition = (_mDefaultTabWidth - _mDefaultTabLineWidth) / 2;

    ///初始化底线位置
    _mLineScrollWidth = initLinePosition;
    //长度和标题一样
    _scrollController.addListener(() {
      final _mOffset = _scrollController.offset;
      if (!_mTapScroll) {
        final scrollValue =
            (_lineAnimationController?.value ?? initLinePosition) -
                _mOffset +
                _mScrollWidth;
        _refreshLineScroll(scrollValue);
      }
      if (_mTapScroll && _mScrollWidth == _mOffset ||
          _mScrollWidth == _mOffset ||
          _mOffset == 0) {
        _refreshTapScroll();
        _mScrollDirect = ScrollDirect.AIDL;
        print("停止滚动$_mScrollDirect $_mTapScroll $_mScrollWidth $_mOffset");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _animationControllers?.values?.forEach((controller) {
      controller?.dispose();
    });
    _lineAnimationController?.dispose();
  }

  ///判断是否点击的当前tab
  bool _isCurrentTab(item) {
    return _mTabIndex == _tabIndex(item);
  }

  ///当前tab的下标
  int _tabIndex(item) {
    return DReaderTabViewInheritedWidget.of(context).tabs?.indexOf(item) ?? 0;
  }

  int _getTabLength() {
    return DReaderTabViewInheritedWidget.of(context).tabs?.length;
  }

  ///切换tab
  void _refreshTab(index) {
    setState(() {
      _mTabIndex = index;
    });
  }

  void _refreshLineScroll(scrollValue) {
    setState(() {
      _mLineScrollWidth = scrollValue;
    });
  }

  ///更新tab字体大小
  void _refreshTxtSize(index, value, defValue) {
    setState(() {
      _mTabTxtSize[index] = value;
      _mDefaultTabTxtSize[index] = defValue;
    });
  }

  void _refreshTapScroll() {
    setState(() {
      _mTapScroll = false;
    });
  }

  ///底部线条滚动
  void _execScrollLine(scrollWidth) {
    ///结束位置
    final endScrollWidth = _mTabIndex * _mDefaultTabWidth +
        (_mDefaultTabWidth - _mDefaultTabLineWidth) / 2 -
        scrollWidth;

    ///起始位置
    final startScrollWidth =
        endScrollWidth - _mDefaultTabWidth + _mDefaultTabLineWidth;

    _lineAnimationController = AnimationController(
        duration: Duration(milliseconds: 150),
        vsync: this,
        lowerBound: startScrollWidth,
        upperBound: endScrollWidth);
    _lineAnimationController.addListener(() {
      var scrollValue = 0.0;
      switch (_mScrollDirect) {
        case ScrollDirect.LEFT:

          ///向左滚动
          scrollValue =
              endScrollWidth + endScrollWidth - _lineAnimationController.value;
          break;
        case ScrollDirect.RIGHT:

          ///向右滚动
          scrollValue = _lineAnimationController.value;
          break;
        case ScrollDirect.AIDL:
          scrollValue = endScrollWidth;
          break;
      }
      _refreshLineScroll(scrollValue);
    });
    _lineAnimationController?.reset();
    _lineAnimationController?.forward();
  }

  ///为tab注册动画
  void _registerAnimation() {
    ///找到 countTab.abs() 之间存在的tab 个数
    int countTab = _mCacheTabIndex - _mTabIndex;

    ///从最小的第一个开始
    int start = min(_mCacheTabIndex, _mTabIndex);
    for (var i = start; i <= start + countTab.abs(); i++) {
      if (countTab.abs() == 0) continue;

      ///选中 和 未选中  动画过渡执行的高度差
      final mDiffUpperLowerHeight = _mUpperBound - _mLowerBound;

      ///定义tab动画切换的时间
      final time = 100;

      ///计算多个tab 阶梯高度 17 17.6 18 20
      var mUpperBound = 0.0;

      ///计算多个tab 阶梯行执行动画的时间
      var mMilliseconds = 0;
      switch (_mScrollDirect) {
        case ScrollDirect.LEFT:
          final count = ((i + 1) - start).abs();

          ///往左点击按钮
          mUpperBound =
              _mLowerBound + (mDiffUpperLowerHeight / count).ceilToDouble();
          mMilliseconds = (time / count).floor();
          break;
        case ScrollDirect.RIGHT:
          final count = start + countTab.abs() + 1 - i;

          ///往右点击按钮
          mUpperBound =
              _mLowerBound + (mDiffUpperLowerHeight / count).ceilToDouble();
          mMilliseconds = (time / count).floor();
          break;
        case ScrollDirect.AIDL:
          break;
      }

      ///创建动画时间
      final Duration dd = Duration(milliseconds: mMilliseconds);
      _animationControllers[i] = AnimationController(
          duration: dd,
          vsync: this,
          lowerBound: _mLowerBound,
          upperBound: mUpperBound);
    }
  }

  ///执行动画
  void _execAnimation() {
    ///遍历所有tab绑定的动画进行消费
    _animationControllers?.keys?.forEach((key) {
      final item = _animationControllers[key];
      item?.addListener(() {
        ///执行完毕移除动画
        if (item.value == item.upperBound) _animationControllers.remove(key);

        ///修改tab文本的大小
        _refreshTxtSize(key, item.value,
            item.lowerBound + (item.upperBound - item.view.value));
      });
      item?.reset();
      item?.forward();
    });
  }

  ///点击tab
  void _onTapTab(index, mRootViewWidth, mChildrenWidth) {
    final mOffset = _scrollController.offset;

    ///得到超出屏幕的距离(即可以滚动的真是距离)
    final needScrollOffset = mChildrenWidth - mRootViewWidth;

    ///过滤 mChildrenWidth 小于屏幕的时 不需要滚动效果
    final mNeedScrollOffset = needScrollOffset <= 0 ? 0 : needScrollOffset;

    if (mNeedScrollOffset > 0) {
      ///点击第一个tab 不需要滚动效果
      if (index == 0) {
        _mScrollWidth = 0;
      } else if (index != _mTabIndex && index == _getTabLength() - 1 ||
          index == _getTabLength() - 1 && _mScrollWidth != mNeedScrollOffset) {
        ///点击最后个tab 滚动距离为超出屏幕的距离
        _mScrollWidth = mNeedScrollOffset;
      } else {
        ///中间滚动的距离为 mNeedScrollOffset/title.length*index 的距离
        _mScrollWidth = mNeedScrollOffset / _getTabLength() * (index + 0.6);
      }
      _scrollController.animateTo(_mScrollWidth,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
    if (index > _mCacheTabIndex) {
      _mScrollDirect = ScrollDirect.RIGHT;
    } else if (index == _mCacheTabIndex) {
      _mScrollDirect = ScrollDirect.AIDL;
    } else {
      _mScrollDirect = ScrollDirect.LEFT;
    }

    ///切换tab
    _refreshTab(index);
    _registerAnimation();
    _execAnimation();
    _execScrollLine(_mScrollWidth);

    ///缓存当前tab下表
    _mCacheTabIndex = _mTabIndex;

    /// 如果手动滑动到顶端 或者 手动滑动到尾部 在点击tab，
    /// 由于位移距离相等 不会触发滚动监听，导致tabScroll状态无法刷新，控件触摸事件被抢占
    if (_mScrollWidth == 0 && _mTabIndex != 0 ||
        _mScrollWidth == _scrollController.offset) _refreshTapScroll();
  }

  ///tab底线  @show 是否显示  默认显示
  Widget _tabLine({bool show}) {
    show = show ?? true;
    return Container(
      constraints: BoxConstraints(minHeight: 3, minWidth: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: <Color>[
            show ? DReaderColors.mainThemeColor : Colors.transparent,
            show ? DReaderColors.mainThemeColor : Colors.transparent
          ])),
    );
  }

  ///tabbar容器
  Widget _tabBarView() {
    return Builder(
      builder: (BuildContext rootContext) {
        return IgnorePointer(
          ignoring: _mTapScroll,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),

            ///控制横向滑动
            scrollDirection: Axis.horizontal,
            child: Builder(builder: (BuildContext childrenContext) {
              return Row(
                ///控制内容整体底部对齐
                crossAxisAlignment: CrossAxisAlignment.end,
                children: DReaderTabViewInheritedWidget.of(context)
                    .tabs
                    .map((item) => GestureDetector(
                          onTap: () {
                            if (_mTapScroll) return;
                            final index = _tabIndex(item);
                            if (index == _mTabIndex) return;
                            print("单击");
                            _mTapScroll = true;

                            ///获取组件大小
                            ///rootContext.size.width
                            ///rootContext.findRenderObject().semanticBounds.width
                            ///rootContext.findRenderObject().paintBounds.width
                            ///得到父容器占用屏幕宽度
                            final mRootViewWidth = rootContext.size.width;

                            ///得到子容器占用屏幕大小
                            final mChildrenWidth = childrenContext.size.width;
                            _onTapTab(index, mRootViewWidth, mChildrenWidth);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                            alignment: Alignment.bottomCenter,
                            constraints: BoxConstraints(
                                minWidth: _mDefaultTabWidth,
                                minHeight: _mDefaultTabHeight),
                            child: _tabView(item),
                          ),
                        ))
                    .toList(),
              );
            }),
          ),
        );
      },
    );
  }

  ///tab组件
  Widget _tabView(item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        DReaderTabInheritedWidget(
          size: _mTabTxtSize[_tabIndex(item)] ?? _mUpperBound,
          defaultSize: _mDefaultTabTxtSize[_tabIndex(item)] ?? _mLowerBound,
          child: DReaderTab(
            text: item,
            isCurrentTab: _isCurrentTab(item),
            key: ValueKey(_tabIndex(item)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ///避免布局被吃掉 屏幕显示pixel 错误提示
        Expanded(
          child: Stack(
            children: <Widget>[
              _tabBarView(),
              Positioned(
                left: _mLineScrollWidth,
                top: _mDefaultTabHeight - 3,
                child: _tabLine(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
          alignment: Alignment.bottomCenter,
          height: _mDefaultTabHeight,
          width: _mDefaultTabWidth,
          color: Colors.transparent,
          child: Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

///将tabview 提取出来进行状态管理，
class DReaderTabViewInheritedWidget extends InheritedWidget {
  final List<String> tabs;

  ///点击tab时触发的滚动是否停止 true 未停止  false 已停止
  final bool tapScroll;

  ///当前选中的tab
  final int tabIndex;

  ///默认的tab宽度
  final double defaultTabWidth;

  ///默认的tab高度
  final double defaultTabHeight;

  final Widget child;

  DReaderTabViewInheritedWidget(
      {Key key,
      @required this.child,
      @required this.tabs,
      this.tapScroll,
      this.tabIndex,
      this.defaultTabWidth,
      this.defaultTabHeight})
      : assert(tabs != null),
        super(key: key, child: child);

  static DReaderTabViewInheritedWidget of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<
            DReaderTabViewInheritedWidget>()
        .widget;
  }

  @override
  bool updateShouldNotify(DReaderTabViewInheritedWidget oldWidget) {
    return oldWidget.tapScroll != tapScroll ||
        oldWidget.tabIndex != tabIndex ||
        oldWidget.defaultTabHeight != defaultTabHeight ||
        oldWidget.defaultTabWidth != defaultTabWidth;
  }
}
