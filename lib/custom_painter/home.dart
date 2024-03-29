import 'package:aprendizaje/custom_painter/header_painter.dart';
import 'package:aprendizaje/custom_painter/radial_progress.dart';
import 'package:flutter/material.dart';

class CustomPainterPage extends StatefulWidget {
  const CustomPainterPage({super.key});

  @override
  State<CustomPainterPage> createState() => _CustomPainterPageState();
}

class _CustomPainterPageState extends State<CustomPainterPage> {
  double nuevoPorciento = 0.0;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    int listLength = 10;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nuevoPorciento += 5;
          if (nuevoPorciento > 100) {
            nuevoPorciento = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.refresh_outlined),
      ),
      // body: Center(
      //   child: Container(
      //     // padding: const EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //       // color: Colors.white,
      //       borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(220 / 2),
      //           bottomLeft: Radius.circular(220 / 2),
      //           bottomRight: Radius.circular(220 / 2),
      //           topRight: Radius.circular(220 / 2)),
      //       gradient: LinearGradient(
      //         colors: [
      //           Colors.blue.withOpacity(0.1),
      //           Colors.blue.withOpacity(0.2)
      //         ],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //       // boxShadow: <BoxShadow>[
      //       //   BoxShadow(
      //       //       color: Colors.grey.withOpacity(0.2),
      //       //       offset: const Offset(1.1, 1.1),
      //       //       blurRadius: 10.0),
      //       // ],
      //     ),
      //     width: 220,
      //     height: 500,
      //     child: CustomPaint(painter: BottleWaterPainter()),
      //   ),
      // ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CustomPaint(
              painter: MyPainter(Colors.blue.shade400),
              child: SizedBox(
                // flex: 3,
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        top: kToolbarHeight,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                // padding: EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.pink.shade900,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 28,
                                ))
                          ],
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          // print('object');
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const RadialProgress(
              strokePrimary: 12,
              porciento: 20,
              height: 100,
              fontStyle: TextStyle(fontSize: 15),
            ),
            Expanded(
              child: Container(
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(
                // color: Colors.blue.shade100,
                // borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          listLength,
                          (index) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.primaries[index],
                                  borderRadius: BorderRadius.only(
                                    topLeft: index == 0
                                        ? const Radius.circular(10)
                                        : Radius.zero,
                                    topRight: index == 0
                                        ? const Radius.circular(10)
                                        : Radius.zero,
                                    bottomLeft: index == listLength - 1
                                        ? const Radius.circular(10)
                                        : Radius.zero,
                                    bottomRight: index == listLength - 1
                                        ? const Radius.circular(10)
                                        : Radius.zero,
                                  ),
                                ),

                                margin: const EdgeInsets.only(top: 3),
                                height: 250 + (index % 2 * 0.3 * 200),
                                // height: size.height,
                              )).toList()

                      // const SizedBox(height: 20)

                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
