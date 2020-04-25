import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreader/model/book_shop_menu.dart';
import 'package:dreader/widget/bookshop/d_reader_flex_menu_horizontal.dart';
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
    // TODO: implement createState
    return _DReaderMenuWidgetState();
  }
}

class _DReaderMenuWidgetState extends State<DReaderMenuWidget> {
  var _mWidth = 0.0;
  final _mIitWidth = 0.0;

  EdgeInsets edgeInsets = EdgeInsets.fromLTRB(0, 10, 0, 0);

  @override
  void initState() {
    super.initState();
    edgeInsets = widget.edgeInsets ?? edgeInsets;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) =>
        {if (_mWidth == _mIitWidth) _refreshWidth(edgeInsets)});
  }

  ///平均得到子child的宽度
  void _refreshWidth(EdgeInsets edgeInsets) {
    final width = ((context.size.width -
                (edgeInsets.right + edgeInsets.left) -
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
    return Padding(
      padding: edgeInsets,
      child: DReaderFlexMenuWidget(
        children: widget.menus
            .map((item) => Column(
                  children: <Widget>[
                    (item.icon.startsWith("http")
                        ? CachedNetworkImage(
                            width: _mWidth,
                            imageUrl: item.icon,
                            placeholder: (context, url) => Image.asset(
                              "static/img/general__shared__book_category_book_shadow.9.png",
                              width: _mWidth,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Image.asset(
                            item.icon,
                            width: 30,
                            height: 30,
                          )),
                    Container(
                      alignment: Alignment.center,
                      width: _mWidth,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(),
                      ),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
