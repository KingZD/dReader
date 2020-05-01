import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Author: zed
 * Date: 2020/4/25 14:53
 * Description:
 */
class DReaderFlexMenuWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Axis direction;
  final List<Widget> children;

  const DReaderFlexMenuWidget(
      {Key key,
      this.mainAxisAlignment,
      this.mainAxisSize,
      this.direction,
      @required this.children})
      : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: direction ?? Axis.horizontal,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
      children: children,
    );
  }
}