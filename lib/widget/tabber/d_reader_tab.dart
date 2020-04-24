import 'package:dreader/common/style/d_reader_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/24 0:14
 * Description:
 */
class DReaderTab extends StatefulWidget {
  final bool isCurrentTab;
  final String text;

  const DReaderTab({Key key, @required this.isCurrentTab, @required this.text})
      : super(key: key);

  @override
  DReaderTabState createState() {
    return DReaderTabState();
  }
}

class DReaderTabState extends State<DReaderTab> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.isCurrentTab ? Colors.black : Colors.black87,
          fontWeight: widget.isCurrentTab ? FontWeight.w500 : FontWeight.normal,
          fontSize: widget.isCurrentTab
              ? DReaderTabInheritedWidget.of(context).size
              : DReaderTabInheritedWidget.of(context).defaultSize),
    );
  }
}

class DReaderTabInheritedWidget extends InheritedWidget {
  final Widget child;
  final double size;
  final double defaultSize;

  DReaderTabInheritedWidget(
      {Key key,
      @required this.child,
      @required this.size,
      @required this.defaultSize})
      : assert(size != null),
        assert(defaultSize != null),
        assert(child != null),
        super(key: key, child: child);

  static DReaderTabInheritedWidget of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<DReaderTabInheritedWidget>()
        .widget;
  }

  @override
  bool updateShouldNotify(DReaderTabInheritedWidget oldWidget) {
    return oldWidget.size != size;
  }
}
