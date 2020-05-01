import 'package:flutter/widgets.dart';

///带间距的组件
class DReaderSpaceWidget extends StatelessWidget {
  final Widget child;
  final double height;

  const DReaderSpaceWidget({Key key, this.height, this.child})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height,
        ),
        child
      ],
    );
  }
}
