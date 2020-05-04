import 'package:flutter/material.dart';

class DReaderMeOperateCell extends StatefulWidget {
  final String icon;
  final int count;
  final String title;
  final double height;

  const DReaderMeOperateCell(
      {Key key, this.icon, this.count, this.title, this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DReaderMeOperateCell();
  }
}

class _DReaderMeOperateCell extends State<DReaderMeOperateCell> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 60,
      child: Row(
        children: <Widget>[
          Image.asset(
            widget.icon,
            width: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(widget.title ?? ""),
            flex: 1,
          ),
          Text("${widget.count ?? ""}"),
          Image.asset(
            "static/img/bookshelf__path_gallery_item_bg.9.png",
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
