import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(this.color);
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final x = size.width;
    final y = size.height;
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x * 0.2, y)
      ..quadraticBezierTo(x * 0.5, y + y * 0.5, x * 0.8, y)
      ..lineTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
