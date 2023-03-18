import 'package:aprendizaje/challege_store_nike/datos.dart';
import 'package:flutter/material.dart';
import 'package:aprendizaje/challenge_nike/datos.dart';
import 'package:aprendizaje/challenge_nike/detail.dart';

class ChallegeNike extends StatefulWidget {
  const ChallegeNike({super.key});

  @override
  State<ChallegeNike> createState() => _ChallegeNikeState();
}

class _ChallegeNikeState extends State<ChallegeNike> {
  int page = 0;
  double pageOpacity = 0.0;
  final _pageController = PageController(viewportFraction: 0.75);

  void _addVoidListener() {
    setState(() {
      pageOpacity = _pageController.page!;
      if (_pageController.page! > 0 && _pageController.page! <= 0.7) {
        page = 0;
      } else if (_pageController.page! > 0.7 && _pageController.page! <= 1.7) {
        page = 1;
      } else if (_pageController.page! > 1.7) {
        page = 2;
      }
    });
  }

  @override
  void initState() {
    _pageController.addListener(_addVoidListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_addVoidListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.android_outlined, size: 30),
            onPressed: () {}),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.list, size: 30)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined, size: 30)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: List.generate(
                  listCategorias.length,
                  (index) => GestureDetector(
                        onTap: () async {
                          await _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                          setState(() {
                            page = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            listCategorias[index],
                            style: TextStyle(
                                color: page == index
                                    ? listShoes[page].color
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: page == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                      )),
            ),
          ),
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: listShoes.length,
            itemBuilder: (context, index) {
              final item = listShoes[index];
              final porcent = (pageOpacity - index).abs().clamp(0.0, 1.0);
              final opacity = porcent.clamp(0.0, 0.9);
              return Transform.translate(
                offset: Offset(index == page ? 0 : 20, 0),
                child: Opacity(
                  opacity: (1 - opacity),
                  child: LayoutBuilder(
                    builder: (_, contatrains) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, _, __) => DetailNikePage(
                                shoes: listShoes, indexPass: index),
                            transitionsBuilder:
                                (context, animation, _, child) =>
                                    FadeTransition(
                                        opacity: animation, child: child),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: index == page ? 30 : 60),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.only(top: index == page ? 30 : 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      item.nombre.toUpperCase(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      item.desc.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 26,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.price,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        item.nombre
                                            .split(' ')
                                            .join('\n')
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: contatrains.maxHeight * 0.2,
                                  left: contatrains.maxWidth * 0.05,
                                  right: -contatrains.maxWidth * 0.16,
                                  bottom: contatrains.maxHeight * 0.2,
                                  child: Hero(
                                      tag: 'shoe_${item.nombre}',
                                      child: Image.asset(item.image))),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                        color: listShoes[index].color,
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
                                    padding: const EdgeInsets.all(20),
                                    child: const Icon(Icons.add,
                                        color: Colors.white, size: 40),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(30),
        height: 140,
        child: Container(
          decoration: BoxDecoration(
              color: listShoes[page].color,
              borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home, size: 30, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.circle_notifications_outlined,
                      size: 50, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_rounded,
                      size: 30, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
