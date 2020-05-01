import 'package:dreader/page/home/d_reader_menu.dart';
import 'package:flutter/widgets.dart';

import '../../model/book_shop_menu.dart';

class DReaderRecommend extends StatelessWidget {
  final List<BookShopMenu> recommend;
  final double height;

  const DReaderRecommend({Key key, @required this.recommend, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "——  "),
          TextSpan(
            text: "热门推荐",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "  ——",
              style: TextStyle(textBaseline: TextBaseline.alphabetic)),
        ], style: TextStyle(textBaseline: TextBaseline.alphabetic))),
        SizedBox(
          height: height,
        ),
        DReaderMenuWidget(menus: recommend)
      ],
    );
  }
}
