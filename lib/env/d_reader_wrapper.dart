import 'package:dreader/env/d_reader_config.dart';
import 'package:flutter/cupertino.dart';

class DReaderWrapper extends StatelessWidget {
  const DReaderWrapper({Key key, this.widget, this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ///设置 Config.DEBUG 的静态变量
//    Config.DEBUG = this.common.config.debug;
//    print("ConfigWrapper build ${Config.DEBUG}");
    return _DReaderWrapper(config: this.config,child: this.widget,);
  }

  static DReaderConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_DReaderWrapper>().config;
  }

  final Widget widget;
  final DReaderConfig config;
}


class _DReaderWrapper extends InheritedWidget {

  const _DReaderWrapper(
      {Key key, @required this.config, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  final DReaderConfig config;

  @override
  bool updateShouldNotify(_DReaderWrapper oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.config != config;
  }

}