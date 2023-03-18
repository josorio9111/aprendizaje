import 'dart:math';

import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const _bodySliver(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // print('object');
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 40),
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Text(
                  'related new List'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _bodySliver extends StatelessWidget {
  const _bodySliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverPersistentHeaderAppBar(
              child: Container(
                color: Colors.white.withOpacity(.95),
                child: Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    _Titulo()
                  ],
                ),
              ),
              minHeigth: 135,
              maxHeigth: 150),
          floating: true,
        ),
        // SliverAppBar(
        //   // pinned: true,
        //   floating: true,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   toolbarHeight: 120,
        //   title: _Titulo(),
        //   centerTitle: false,
        //   // automaticallyImplyLeading: false,
        //   leading: BackButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     color: Colors.black,
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate([
            _ListaWidgets(),
            SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverPersistentHeaderAppBar extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderAppBar(
      {required this.minHeigth, required this.maxHeigth, required this.child});
  final double minHeigth;
  final double maxHeigth;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => max(minHeigth, maxHeigth);

  @override
  double get minExtent => min(minHeigth, maxHeigth);

  @override
  bool shouldRebuild(_SliverPersistentHeaderAppBar oldDelegate) {
    return maxHeigth != oldDelegate.maxHeigth ||
        minHeigth != oldDelegate.minHeigth ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: const Text(
              'New\nList',
              style: TextStyle(fontSize: 35, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListaWidgets extends StatelessWidget {
  const _ListaWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            17,
            (index) => _ListItem(index: index),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 10),
      height: 130,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.primaries[index],
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        Colors.primaries[index].value.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
