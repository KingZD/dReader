import 'dart:async';

import 'package:dreader/page/d_reader_webview.dart';
import 'package:dreader/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 导航栏
 */
class NavigatorUtils {
  ///主页
  static goHome(BuildContext context) {
    pushReplacementNamed(context, HomePage.sName);
  }

  ///主页
  static goLogin(BuildContext context) {
  }

  ///全屏Web页面
  static Future goDReaderWebView(BuildContext context, String url, String title) {
    return NavigatorRouter(context, new DReaderWebView(url, title));
  }

  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static push(BuildContext context, Widget scene, {Object arguments}) {
    final settings = ModalRoute.of(context).settings;
    print('路由地址:${settings?.name ?? ''}');
    print('是否初始页面路由：${settings?.isInitialRoute ?? false}');
    print('参数:${arguments.toString()}');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => scene,
          settings: RouteSettings(
              name: settings?.name ?? '',
              isInitialRoute: settings?.isInitialRoute ?? false,
              arguments: arguments)),
    );
  }

  ///切换参数页面
  static pushNamed(
      BuildContext context,
      String routeName, {
        Object arguments,
      }) {
    final settings = ModalRoute.of(context).settings;
    print('路由地址:${settings?.name ?? ''}');
    print('是否初始页面路由：${settings?.isInitialRoute ?? false}');
    print('参数:${arguments.toString()}');
    //判断是否需要登录
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static pop<T extends Object>(BuildContext context, [ T result ]){
    Navigator.pop(context,result);
  }

  ///公共打开方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(

        ///不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }
}
