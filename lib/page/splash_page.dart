import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/navigator_utils.dart';
import 'package:dreader/widget/guide/guide_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String sName = "SplashPage";

  @override
  _SPlashPage createState() {
    // TODO: implement createState
    return _SPlashPage();
  }
}

class _SPlashPage extends State<SplashPage> {

  List<Widget> children;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    children = _getGuideWidget();
  }

  List<Widget> _getGuideWidget() {
    return [
      Container(
        child: Image.asset(
          "static/img/guide_one.png",
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Image.asset(
          "static/img/guide_two.png",
          fit: BoxFit.cover,
        ),
      ),
      Stack(
        children: <Widget>[
          Image.asset(
            "static/img/guide_three.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: OutlineButton(
                onPressed: (){NavigatorUtils.goHome(context);} ,
                child: Text("开启你的奇幻之旅"),
              ),
            ),
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: DReaderColors.cardWhite,
        ),
        child: WelcomeGuide(children: children),
      ),
    );
  }
}
