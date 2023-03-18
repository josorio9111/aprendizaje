import 'package:flutter/material.dart';

const listCategorias = ['Basketball', 'Running', 'Training'];
final listShoes = [
  Shoes(
    nombre: 'Nike Air',
    desc: 'Nike Air 1 Mid Sec',
    price: '\$250',
    categoria: 'Basketball',
    color: Colors.amber,
    image: 'assets/images/amarillo.png',
  ),
  Shoes(
    nombre: 'Nike Air Jordan',
    desc: 'Nike Air Jordan 1 Mid Sec',
    price: '\$300',
    categoria: 'Running',
    color: Colors.lightBlue,
    image: 'assets/images/negro.png',
  ),
  Shoes(
    nombre: 'Nike Zoom',
    desc: 'ZoomX Vaporfy ',
    price: '\$200',
    categoria: 'Training',
    color: Colors.lightGreen,
    image: 'assets/images/verde.png',
  ),
];

class Shoes {
  final String nombre;
  final String desc;
  final String price;
  final String categoria;
  final Color color;
  final String image;

  Shoes(
      {required this.nombre,
      required this.desc,
      required this.price,
      required this.categoria,
      required this.color,
      required this.image});
}
