import 'package:aprendizaje/challege_store_nike/home.dart';
import 'package:aprendizaje/challenge_nike/home.dart';
import 'package:aprendizaje/custom_bottom_navi_bar/home.dart';
import 'package:aprendizaje/custom_painter/home.dart';
// import 'package:aprendizaje/custom_painter/water_view.dart';
import 'package:aprendizaje/multiple_card/home.dart';
import 'package:aprendizaje/pinteres_layout/home.dart';
import 'package:aprendizaje/slivers/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aprendizaje',
      home: ListaWidget(),
    );
  }
}

class ListaWidget extends StatelessWidget {
  const ListaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue.shade800,
            floating: true,
            primary: true,
            toolbarHeight: 120,
            expandedHeight: 130,
            elevation: 0,
            title: const Text(
              'Ejemplos Apendizaje',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ButtonExamples(
                      nombre: 'Multiple Card Flow', page: MultipleCardFlow()),
                  const ButtonExamples(
                      nombre: 'Chanllege Nike', page: ChallegeNike()),
                  ButtonExamples(
                      nombre: 'Change Nike Store', page: StoreNikePage()),
                  const ButtonExamples(
                      nombre: 'Custom Painter', page: CustomPainterPage()),
                  const ButtonExamples(
                      nombre: 'Custom Navi Bar', page: CustomNaviBar()),
                  const ButtonExamples(
                      nombre: 'Pinteres Layout', page: PinteresLayoutPage()),
                  const ButtonExamples(nombre: 'Slivers', page: SliversPage()),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}

class ButtonExamples extends StatelessWidget {
  const ButtonExamples({super.key, required this.page, required this.nombre});
  final Widget page;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white)
              ],
            ),
          )),
    );
  }
}
