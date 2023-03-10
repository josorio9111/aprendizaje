import 'package:aprendizaje/challenge_nike/datos.dart';
import 'package:aprendizaje/shake_transition/shake.dart';
import 'package:flutter/material.dart';

class DetailNikePage extends StatefulWidget {
  final Shoes shoe;
  final int indexPass;
  const DetailNikePage(
      {super.key, required this.shoe, required this.indexPass});

  @override
  State<DetailNikePage> createState() => _DetailNikePageState();
}

class _DetailNikePageState extends State<DetailNikePage> {
  int valueIndexSize = 1;
  int indexSelect = 0;

  @override
  void initState() {
    indexSelect = widget.indexPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) => AnimatedContainer(
                height: value * (size.height * 0.5),
                width: value * (size.height * 0.5),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: listShoes[indexSelect].color,
                    shape: BoxShape.circle),
                duration: const Duration(milliseconds: 500),
              ),
            )),
        Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.grey.shade800,
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
        Positioned(
            top: size.height * 0.2,
            left: 0,
            right: 0,
            child: FittedBox(
              child: Text(
                widget.shoe.categoria,
                style: TextStyle(color: Colors.grey.shade100),
              ),
            )),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: size.height * 0.22,
            left: size.width * 0.07,
            right: size.width * 0.07,
            child: Hero(
              tag: 'shoe_${widget.shoe.nombre}',
              child: FlutterLogo(
                size: (250 + 250 * valueIndexSize * 0.1).toDouble(),
              ),
            )),
        Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShakeTransition(
                      direccion: -1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.shoe.categoria.toUpperCase(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.shoe.nombre.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    ShakeTransition(
                      child: Text(
                        widget.shoe.price,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text('SIZE',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      const SizedBox(height: 5),
                      Row(
                        children: List.generate(
                            4,
                            (index) => GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    index == valueIndexSize
                                                        ? listShoes[indexSelect]
                                                            .color
                                                        : Colors.white)),
                                        onPressed: () {
                                          setState(() {
                                            valueIndexSize = index;
                                          });
                                        },
                                        child: Text(
                                          (index + 7).toString(),
                                          style: TextStyle(
                                              color: index == valueIndexSize
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                  ),
                                )),
                      )
                    ],
                  ),
                ),
                ShakeTransition(
                  direccion: -1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text('COLORS',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      const SizedBox(height: 5),
                      Row(
                        children: List.generate(
                            listShoes.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexSelect = index;
                                    });
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: listShoes[index].color,
                                        border: index == indexSelect
                                            ? Border.all(
                                                width: 2, color: Colors.white)
                                            : null,
                                      )),
                                )),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
