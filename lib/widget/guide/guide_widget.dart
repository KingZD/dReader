import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/common_utils.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/22 15:15
 * Description: 引导页组件
 */
class WelcomeGuide extends StatefulWidget {
  WelcomeGuide({Key key, this.children})
      : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomeGuide();
  }
}

class _WelcomeGuide extends State<WelcomeGuide> {
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      // todo 做一些动画属性
//      print("${_pageController.offset}-${_pageController.page}-${CommonUtils.screenSize(context).width}-${_pageController.position}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  Widget _welcomeGuide() {
    return PageView(
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      children: widget.children,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _welcomeGuide();
  }
}
