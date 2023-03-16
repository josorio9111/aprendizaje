import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(this.color);
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    final colors = [
      Colors.pink.shade400,
      Colors.pink.shade100,
      Colors.blue.shade50
    ];
    final stops = [0.0, 0.65, 1.0];
    final gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
        stops: stops);
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(
          Rect.fromCenter(center: Offset(x / 2, y / 2), width: x, height: y));
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, y * 0.9)
      ..quadraticBezierTo(x * .01 * .5, y, x * .1, y)
      ..lineTo(x * .35, y)
      ..quadraticBezierTo(x * 0.4, y, x * .4, y * .95)
      ..lineTo(x * .4, y * .85)
      ..quadraticBezierTo(x * .4, y * .8, x * .42, y * .8)
      ..lineTo(x * .58, y * .8)
      ..quadraticBezierTo(x * .6, y * .8, x * .6, y * .85)
      ..lineTo(x * .6, y * .85)
      ..lineTo(x * .6, y * .95)
      ..quadraticBezierTo(x * .6, y * .99, x * .63, y)
      ..lineTo(x * .68, y)
      ..lineTo(x * .9, y)
      ..quadraticBezierTo(x * 0.99, y, x, y * .9)
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
