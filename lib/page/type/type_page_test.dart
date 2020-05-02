import 'dart:math';

import 'package:flutter/material.dart';

class TypePage extends StatefulWidget {
  @override
  _TypePage createState() {
    return _TypePage();
  }
}

class _TypePage extends State<TypePage> {
  PageController pageController = PageController(initialPage: 1);
  ScrollController scrollController = new ScrollController();
  bool enableList = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset <= 0) print("列表到顶了");
      enableList = false;
      setState(() {});
    });

    pageController.addListener(() {
      print("页面到顶了${pageController.offset}  ${pageController.offset <= 0}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Center(
          child: Text("第一层 藏起来"),
        ),
        ListView.builder(
          physics: enableList
              ? BouncingScrollPhysics()
              : NeverScrollableScrollPhysics(),
          controller: scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              color: Colors.amber[Random().nextInt(9) * 100],
              child: Text("$index"),
            );
          },
          itemCount: 20,
        ),
      ],
    );
  }
}
