import 'package:flutter/material.dart';
import 'radial_progress.dart';

class CustomPainterPage extends StatefulWidget {
  const CustomPainterPage({super.key});

  @override
  State<CustomPainterPage> createState() => _CustomPainterPageState();
}

class _CustomPainterPageState extends State<CustomPainterPage> {
  double nuevoPorciento = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nuevoPorciento += 10;
          if (nuevoPorciento > 100) {
            nuevoPorciento = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.refresh_outlined),
      ),
      body: Center(
        child: RadialProgress(
          porciento: nuevoPorciento,
        ),
      ),
    );
  }
}
