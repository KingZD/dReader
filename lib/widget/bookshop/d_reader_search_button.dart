import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/25 14:45
 * Description:
 */
class DReaderSearchWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String text;
  final double height;
  final double width;
  final Icon icon;

  const DReaderSearchWidget(
      {Key key,
      this.backgroundColor,
      this.color,
      this.text,
      this.height,
      this.width,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: height ?? 35,
      alignment: Alignment.centerLeft,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xaaE4EAF0),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20)),
      child: FlatButton.icon(
        onPressed: () {},
        icon: icon ?? Icon(Icons.search),
        label: Text(
          text ?? "",
          style: TextStyle(color: color ?? Color(0xffAAAEB3)),
        ),
      ),
    );
  }
}
