import 'package:flutter/cupertino.dart';

/**
 * Author: zed
 * Date: 2020/4/24 21:06
 * Description:
 */
class DReaderTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class DReaderTabViewState extends State<DReaderTabView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

///将tabview 提取出来进行状态管理，
class DReaderTabViewInheritedWidget extends InheritedWidget {
  ///点击tab时触发的滚动是否停止 true 未停止  false 已停止
  final bool tapScroll;

  ///当前选中的tab
  final int tabIndex;

  ///默认的tab宽度
  final double defaultTabWidth;

  ///默认的tab高度
  final double defaultTabHeight;

  DReaderTabViewInheritedWidget(
      {this.tapScroll,
      this.tabIndex,
      this.defaultTabWidth,
      this.defaultTabHeight});

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
