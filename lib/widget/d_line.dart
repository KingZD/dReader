import 'package:flutter/material.dart';

class DReaderLine extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const DReaderLine({Key key, this.color, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _line(color: color,width: width,height: height),
    );
  }
}

class _line extends CustomPainter {
  final Color color;
  final double width;
  final double height;

  _line({this.color, this.width, this.height});

  @override
  void paint(Canvas canvas, Size size) {
    //draw border
    Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(20, 20), Offset(100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
