import 'package:flutter/material.dart';

class BottleWaterPainter extends CustomPainter {
  // BottleWaterPainter(this.por);
  // double por;

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    Offset center = Offset(x * .5, y * .5);

    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final rr = RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: x, height: y),
        Radius.circular(x / 2));

    Paint paintFill = Paint()
      ..color = Colors.lightBlueAccent.shade200
      ..style = PaintingStyle.fill;
// 0.82
// 0.22
    double por = .25;
    final rrect = RRect.fromRectAndCorners(
      Rect.fromCenter(
          center: Offset(x * .5, y * (1 - por) + por * y * .5),
          width: x,
          height: y * por),
      topLeft: Radius.circular(por == 1 ? x * .5 : 0),
      topRight: Radius.circular(por == 1 ? x * .5 : 0),
      bottomLeft: Radius.circular(x * .5),
      bottomRight: Radius.circular(x * .5),
    );
    canvas.drawRRect(rrect, paintFill);
    canvas.drawRRect(rr, paint);
  }

  @override
  bool shouldRepaint(BottleWaterPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BottleWaterPainter oldDelegate) => true;
}
