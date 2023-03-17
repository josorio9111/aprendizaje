import 'package:flutter/material.dart';

class City {
  City(
      {required this.nombre,
      required this.price,
      required this.image,
      this.citiesArr});
  final String nombre;
  final String price;
  final String image;
  final List<City>? citiesArr;
}

final cities = [
  City(
      nombre: 'San Francisco',
      price: '300USD',
      image: 'assets/images/images.jpeg',
      citiesArr: [
        City(
            nombre: 'San Francisco 1',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'San Francisco 2',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'San Francisco 3',
            price: '200USD',
            image: 'assets/images/images.jpeg')
      ]),
  City(
      nombre: 'New York',
      price: '350USD',
      image: 'assets/images/images.jpeg',
      citiesArr: [
        City(
            nombre: 'New York 1',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'New York 2',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'New York 3',
            price: '200USD',
            image: 'assets/images/images.jpeg')
      ]),
  City(
      nombre: 'Tokyo',
      price: '340USD',
      image: 'assets/images/images.jpeg',
      citiesArr: [
        City(
            nombre: 'Tokyo 1',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'Tokyo 2',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'Tokyo 3',
            price: '200USD',
            image: 'assets/images/images.jpeg')
      ]),
  City(
      nombre: 'Miami',
      price: '200USD',
      image: 'assets/images/images.jpeg',
      citiesArr: [
        City(
            nombre: 'Miami 1',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'Miami 2',
            price: '200USD',
            image: 'assets/images/images.jpeg'),
        City(
            nombre: 'Miami 3',
            price: '200USD',
            image: 'assets/images/images.jpeg')
      ]),
];
