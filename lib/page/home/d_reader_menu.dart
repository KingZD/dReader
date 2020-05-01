import 'package:dreader/model/book_shop_menu.dart';
import 'package:dreader/widget/bookshop/d_reader_flex_menu_horizontal.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/25 15:24
 * Description:
 */
class DReaderMenuWidget extends StatefulWidget {
  final Widget child;
  final List<BookShopMenu> menus;
  final double widgetSpace = 10.0;
  final EdgeInsets edgeInsets;

  const DReaderMenuWidget({Key key, this.menus, this.edgeInsets, this.child})
      : super(key: key);

  @override
  _DReaderMenuWidgetState createState() {
    return _DReaderMenuWidgetState();
  }
}

class _DReaderMenuWidgetState extends State<DReaderMenuWidget> {
  var _mWidth = 0.0;
  final _mIitWidth = 0.0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) =>
        {if (_mWidth == _mIitWidth) _refreshWidth()});
  }

  ///平均得到子child的宽度
  void _refreshWidth() {
    final width = ((context.size.width -
                widget.widgetSpace * widget.menus.length +
                1) /
            widget.menus.length)
        .floorToDouble();
    setState(() {
      _mWidth = width;
    });
//    print("menuRootWidth:${context.size.width} $_mWidth $_mIitWidth");
  }

  @override
  Widget build(BuildContext context) {
    return DReaderFlexMenuWidget(
        children: widget.menus
            .map((item) => Column(
                  children: <Widget>[
                    (item.icon.startsWith("http")
                        ? DImage(
                            width: _mWidth,
                            height: 120,
                            imageUrl: item.icon,
                          )
                        : Image.asset(
                            item.icon,
                            width: 30,
                            height: 30,
                          )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: _mWidth,
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ))
            .toList(),
      );
  }
}
