import 'package:aprendizaje/challege_store_nike/datos.dart';
import 'package:aprendizaje/challege_store_nike/shopping_card.dart';
import 'package:aprendizaje/shake_transition/shake.dart';
import 'package:flutter/material.dart';

class StoreNikeDetailPage extends StatefulWidget {
  const StoreNikeDetailPage({super.key, required this.shoe});
  final NikeShoes shoe;

  @override
  State<StoreNikeDetailPage> createState() => _StoreNikeDetailPageState();
}

class _StoreNikeDetailPageState extends State<StoreNikeDetailPage> {
  int current = 0;
  final _pageController = PageController();
  final ValueNotifier<bool> _bottomBarVisible = ValueNotifier(false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bottomBarVisible.value = true;
    });
    _pageController.addListener(pageViewListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(pageViewListener);
    _pageController.dispose();
    super.dispose();
  }

  void pageViewListener() {
    setState(() {
      current = _pageController.page!.round();
    });
  }

  _openShoppingCard(BuildContext context) async {
    _bottomBarVisible.value = false;
    await Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => ShoppingCard(shoe: widget.shoe),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ));
    _bottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Icon(
          Icons.android,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                        controller: _pageController,
                        itemCount: widget.shoe.images.length,
                        itemBuilder: (context, index) {
                          final sho = widget.shoe.images[index];
                          return Stack(
                            children: [
                              Positioned.fill(
                                  child: Hero(
                                tag: 'backgound_${widget.shoe.model}',
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: widget.shoe.color),
                                ),
                              )),
                              Positioned(
                                top: 0,
                                left: 70,
                                right: 70,
                                child: Hero(
                                  tag: 'numero_${widget.shoe.model}',
                                  child: ShakeTransition(
                                    duration: const Duration(milliseconds: 800),
                                    offset: 20,
                                    axis: Axis.vertical,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: FittedBox(
                                        child: Text(
                                          widget.shoe.modelNumber.toString(),
                                          style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Hero(
                                            tag: 'image_${widget.shoe.model}',
                                            child: ShakeTransition(
                                                duration: index == 0
                                                    ? const Duration(
                                                        milliseconds: 800)
                                                    : Duration.zero,
                                                offset: 10,
                                                axis: Axis.vertical,
                                                child: Image.asset(sho)))),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 50,
                        child: ShakeTransition(
                          // direccion: -1,
                          duration: const Duration(milliseconds: 1200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(widget.shoe.images.length,
                                (index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 2),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: current == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    shape: BoxShape.circle),
                              );
                            }),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: ShakeTransition(
                duration: const Duration(milliseconds: 2000),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.shoe.model.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${widget.shoe.oldprice}',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${widget.shoe.currentprice}',
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text('Avalible Sizes'.toUpperCase()),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              5,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.13, color: Colors.grey)),
                                    padding: const EdgeInsets.all(10),
                                    // margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      (index * 0.5 + 6).toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )),
                        ),
                        const SizedBox(height: 20),
                        Text('Avalible Sizes'.toUpperCase()),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              5,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.13, color: Colors.grey)),
                                    padding: const EdgeInsets.all(10),
                                    // margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      (index * 0.5 + 6).toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )),
                        ),
                        const SizedBox(height: 20),
                        Text('Avalible Sizes'.toUpperCase()),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              5,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.13, color: Colors.grey)),
                                    padding: const EdgeInsets.all(10),
                                    // margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      (index * 0.5 + 6).toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _bottomBarVisible,
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 10,
                right: 10,
                bottom: value ? 10 : -kToolbarHeight * 1.5,
                duration: const Duration(milliseconds: 250),
                child: child!,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: 'fab_1',
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'fab_2',
                    backgroundColor: Colors.black,
                    onPressed: () {
                      _openShoppingCard(context);
                    },
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
