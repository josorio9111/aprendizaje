import 'package:aprendizaje/multiple_card/datos.dart';
import 'package:aprendizaje/multiple_card/home.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.city});
  final City city;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const Positioned.fill(
              child: DecoratedBox(
                  decoration: BoxDecoration(gradient: bgGradiant))),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: CityWidget(
                    city: city,
                    padding: const EdgeInsets.only(left: 40, top: 40),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              city.citiesArr!.length,
                              (index) => SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    child: BottomPanel(
                                        city: city.citiesArr![index]),
                                  )),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Positioned(
              top: 40,
              left: 10,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
