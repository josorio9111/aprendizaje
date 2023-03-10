import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 1000),
      this.axis = Axis.horizontal,
      this.offset = 140,
      this.direccion = 1.0});
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final double direccion;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset * direccion, 0)
              : Offset(0, value * offset * direccion),
          child: child,
        );
      },
      child: child,
    );
    // return child;
  }
}
