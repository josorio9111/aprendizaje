import 'package:flutter/material.dart';
import 'dart:math';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    super.key,
    this.porciento = 0,
    this.width = 250,
    this.height = 250,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
    this.displayText = true,
    this.onAnimated,
    this.strokeSecundary = 4,
    this.strokePrimary = 15,
    this.duration = const Duration(milliseconds: 300),
    this.fontStyle = const TextStyle(fontSize: 25),
  });
  final double width;
  final double height;
  final Color primaryColor;
  final Color secundaryColor;
  final bool displayText;
  final VoidCallback? onAnimated;
  final double porciento;
  final double strokeSecundary;
  final double strokePrimary;
  final Duration duration;
  final TextStyle fontStyle;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late double oldPorcent;

  @override
  void initState() {
    oldPorcent = widget.porciento;
    controller = AnimationController(vsync: this, duration: widget.duration);
    controller.addStatusListener(_addStatusListener);
    super.initState();
  }

  void _addStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed &&
        widget.onAnimated != null &&
        oldPorcent != 0) {
      widget.onAnimated!();
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(_addStatusListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferencia = widget.porciento - oldPorcent;
    oldPorcent = widget.porciento;

    return Container(
      padding: const EdgeInsets.all(5),
      height: widget.height,
      width: widget.width,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double porAnimar =
              (oldPorcent - diferencia) + (diferencia * controller.value);
          return CustomPaint(
            painter: MyCircularPainter(
                porAnimar,
                widget.secundaryColor,
                widget.primaryColor,
                widget.strokeSecundary,
                widget.strokePrimary),
            child: widget.displayText
                ? Center(
                    child: Text(
                    '${porAnimar.toStringAsFixed(2)} %',
                    style: widget.fontStyle,
                  ))
                : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class MyCircularPainter extends CustomPainter {
  MyCircularPainter(this.porciento, this.secundaryColor, this.primaryColor,
      this.strokeSecundary, this.strokePrimary);

  double porciento;
  Color secundaryColor;
  Color primaryColor;
  double strokeSecundary;
  double strokePrimary;

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    Offset center = Offset(x * 0.5, y * 0.5);
    double radius = min(x * 0.5, y * 0.5);

    Paint paintCircle = Paint()
      ..color = secundaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeSecundary;
    canvas.drawCircle(center, radius, paintCircle);

    Paint paintArco = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokePrimary
      ..strokeCap = StrokeCap.round;
    double arcAngle = 2 * pi * porciento / 100;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi * 0.5,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
