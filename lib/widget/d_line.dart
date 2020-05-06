import 'package:flutter/material.dart';

class DReaderLine extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double left;
  final double right;
  final double top;
  final double bottom;

  const DReaderLine(
      {Key key,
      this.color,
      this.width,
      this.height,
      this.left,
      this.right,
      this.top,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _line(
          color: color,
          width: width,
          height: height,
          left: left,
          right: right,
          top: top,
          bottom: bottom),
      size: Size(double.infinity, height + (top ?? 0.0) + (bottom ?? 0.0)),
    );
  }
}

class _line extends CustomPainter {
  final Color color;
  final double width;
  final double height;
  final double left;
  final double right;
  final double top;
  final double bottom;

  _line(
      {Key key,
      this.color,
      this.width,
      this.height,
      this.left,
      this.right,
      this.top,
      this.bottom});

  @override
  void paint(Canvas canvas, Size size) {
    //draw border
    Paint _paint = new Paint()
      ..color = color ?? Colors.grey[100]
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = height ?? 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(left ?? 0.0, top ?? 0.0),
        Offset((width ?? size.width) - (right ?? 0.0), top ?? 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
