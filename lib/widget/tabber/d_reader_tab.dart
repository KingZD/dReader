import 'package:dreader/common/style/d_reader_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/24 0:14
 * Description:
 */
class DReaderTab extends StatefulWidget{

  final bool isCurrentTab;
  final String text;

  const DReaderTab({Key key, @required this.isCurrentTab, @required this.text}) : super(key: key);

  @override
  DReaderTabState createState() {
    // TODO: implement createState
    return DReaderTabState();
  }
}

class DReaderTabState extends State<DReaderTab>{
  double _defaultSize = DReaderConstant.middleTextWhiteSize;
  double _size = DReaderConstant.textSize_20;

  void changeSize(size){
    setState(() {
      _size = size;
      print("$_size");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.isCurrentTab ? Colors.black : Colors.black87,
          fontWeight:
          widget.isCurrentTab ? FontWeight.w600 : FontWeight.normal,
          fontSize: widget.isCurrentTab
              ? _size
              : _defaultSize
      ),
    );
  }
}