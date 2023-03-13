import 'dart:math';
// import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CircularPainter extends CustomPainter {
  CircularPainter(this.porciento, this.circularColor, this.backgroundColor,
      this.strokeCircular, this.strokeArc);

  double porciento;
  Color circularColor;
  Color backgroundColor;
  double strokeCircular;
  double strokeArc;

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    Offset center = Offset(x / 2, y / 2);
    double radius = min(x / 2, y / 2);

    Paint paintCircle = Paint()
      ..color = circularColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeCircular;
    canvas.drawCircle(center, radius, paintCircle);

    Paint paintArco = Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeArc
          ..strokeCap = StrokeCap.round
        // ..shader = LinearGradient(colors: [
        //   Colors.blueAccent,
        //   backgroundColor,
        // ]).createShader(
        //   Rect.fromCircle(center: center, radius: radius),
        // )
        ;
    double arcAngle = 2 * pi * porciento / 100;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
