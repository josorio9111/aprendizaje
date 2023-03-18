import 'package:aprendizaje/challege_store_nike/datos.dart';
import 'package:aprendizaje/challege_store_nike/detail.dart';
import 'package:flutter/material.dart';

class StoreNikePage extends StatelessWidget {
  StoreNikePage({super.key});

  final ValueNotifier<bool> _bottomBarVisible = ValueNotifier(true);

  void _onTapItem(BuildContext context, shoe) async {
    _bottomBarVisible.value = false;
    await Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => StoreNikeDetailPage(shoe: shoe),
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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                  child: Icon(
                    Icons.android,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: kToolbarHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                          shoesNikes.length,
                          (index) => NikeShoeItem(
                                shoe: shoesNikes[index],
                                onTap: () {
                                  _onTapItem(context, shoesNikes[index]);
                                },
                              )),
                    ),
                  ),
                ))
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _bottomBarVisible,
              builder: (context, value, child) {
                return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: value ? 0 : -kToolbarHeight,
                    right: 0,
                    left: 0,
                    height: kToolbarHeight,
                    child: child!);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.home, size: 30),
                    Icon(Icons.search, size: 30),
                    Icon(Icons.favorite_border, size: 30),
                    Icon(Icons.shopping_bag_outlined, size: 30),
                    CircleAvatar(radius: 15)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NikeShoeItem extends StatelessWidget {
  const NikeShoeItem({Key? key, required this.shoe, required this.onTap})
      : super(key: key);
  final NikeShoes shoe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Positioned.fill(
              child: Hero(
            tag: 'backgound_${shoe.model}',
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: shoe.color, borderRadius: BorderRadius.circular(15)),
            ),
          )),
          Positioned(
              top: 0,
              left: 30,
              right: 30,
              child: Hero(
                tag: 'numero_${shoe.model}',
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      shoe.modelNumber.toString(),
                      style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Hero(
                    tag: 'image_${shoe.model}',
                    child: Image.asset(shoe.images.first)),
                const SizedBox(height: 10),
                Text(
                  shoe.model.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.favorite_border,
                        color: Colors.grey, size: 28),
                    Column(
                      children: [
                        Text(
                          '\$${shoe.oldprice}',
                          style: const TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${shoe.currentprice}',
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Icon(Icons.shopping_cart_outlined,
                        color: Colors.grey, size: 28)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
