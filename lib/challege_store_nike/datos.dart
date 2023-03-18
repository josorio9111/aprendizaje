import 'package:flutter/material.dart';

class NikeShoes {
  final String model;
  final double oldprice;
  final double currentprice;
  final List<String> images;
  final int modelNumber;
  final Color color;

  NikeShoes(
      {required this.model,
      required this.oldprice,
      required this.currentprice,
      required this.images,
      required this.modelNumber,
      required this.color});
}

final shoesNikes = <NikeShoes>[
  NikeShoes(
      model: 'Air max 90 ez black',
      oldprice: 299,
      currentprice: 149,
      images: [
        'assets/images/negro.png',
        'assets/images/verde.png',
        'assets/images/amarillo.png',
        'assets/images/azul.png',
      ],
      modelNumber: 90,
      color: Colors.grey.shade50),
  NikeShoes(
      model: 'Air max 95 red',
      oldprice: 399,
      currentprice: 299,
      images: [
        'assets/images/verde.png',
        'assets/images/amarillo.png',
        'assets/images/negro.png',
        'assets/images/azul.png',
      ],
      modelNumber: 95,
      color: Colors.red.shade50),
  NikeShoes(
      model: 'Air max 270 gold',
      oldprice: 349,
      currentprice: 270,
      images: [
        'assets/images/amarillo.png',
        'assets/images/verde.png',
        'assets/images/negro.png',
        'assets/images/azul.png',
      ],
      modelNumber: 270,
      color: Colors.amber.shade50),
  NikeShoes(
      model: 'Air max 98 free',
      oldprice: 299,
      currentprice: 149,
      images: [
        'assets/images/azul.png',
        'assets/images/verde.png',
        'assets/images/negro.png',
        'assets/images/amarillo.png',
        // const FlutterLogo(size: 180)
      ],
      modelNumber: 98,
      color: Colors.green.shade50),
];
