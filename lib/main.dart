import 'package:aprendizaje/challege_store_nike/home.dart';
import 'package:aprendizaje/challenge_nike/home.dart';
import 'package:aprendizaje/custom_bottom_navi_bar/home.dart';
import 'package:aprendizaje/custom_painter/home.dart';
import 'package:aprendizaje/custom_painter/water_view.dart';
import 'package:aprendizaje/multiple_card/home.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ],
          ),
        ),
      )),
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
      color: Colors.lightBlue,
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              nombre,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          )),
    );
  }
}
