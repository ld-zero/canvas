import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  Color color;
  double radius;

  ColorCircle(this.color, this.radius);

  @override
  Widget build(BuildContext context) {
    double diameter = radius * 2;
    return CustomPaint(
        size: Size(diameter, diameter),
        painter: _ColorCirclePainter(color, radius));
  }
}

class _ColorCirclePainter extends CustomPainter {
  Color color;
  double radius;

  _ColorCirclePainter(this.color, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    Offset center = Offset(radius, radius);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
