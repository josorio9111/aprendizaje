import 'package:aprendizaje/challege_store_nike/datos.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key, required this.shoe});
  final NikeShoes shoe;

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animationReSize;
  Animation? _animationMove1;
  Animation? _animationMove2;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animationReSize = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller!, curve: const Interval(0.0, 0.3)));
    _animationMove1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0.3, 0.6,
                curve: Curves.fastLinearToSlowEaseIn)));
    _animationMove2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0.6, 1, curve: Curves.elasticIn)));
    _controller?.addStatusListener(_addListenerController);
    super.initState();
  }

  _addListenerController(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller?.removeStatusListener(_addListenerController);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          final panelWidth =
              (size.width * _animationReSize?.value).clamp(60, size.width);

          return Stack(fit: StackFit.expand, children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ),
            if (_animationMove1?.value != 1)
              Positioned(
                top: size.height * 0.4 +
                    (_animationMove1?.value * size.height * 0.4815),
                width: 60,
                left: size.width / 2 - panelWidth / 2,
                child: panelSizeWidth(size),
              ),
            Positioned(
                bottom: 40.0 - (_animationMove2?.value * 100),
                left: size.width / 2 -
                    (200 * _animationReSize?.value).clamp(60, 200) / 2,
                child: buttomBlack())
          ]);
        },
      ),
    );
  }

  InkWell buttomBlack() {
    return InkWell(
      onTap: () {
        _controller?.forward();
      },
      child: SizedBox(
        width: (_animationReSize?.value * 200).clamp(60, 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _animationMove1?.value == 1
                        ? Icons.favorite
                        : Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  if (_animationReSize?.value == 1) ...[
                    const SizedBox(width: 10),
                    Text(
                      'Add to cart'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack panelSizeWidth(Size size) {
    return Stack(
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 1, end: 0),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
          builder: (context, value, child) => Transform.translate(
            offset: Offset(0.0, value * size.height * 0.6),
            child: child,
          ),
          child: Container(
            height: (size.height * 0.6 * _animationReSize?.value)
                .clamp(60, size.height * 0.6),
            width: (size.width * _animationReSize?.value).clamp(60, size.width),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft:
                      Radius.circular(_animationReSize?.value == 1 ? 0 : 30),
                  bottomRight:
                      Radius.circular(_animationReSize?.value == 1 ? 0 : 30)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: _animationReSize?.value == 1 ? 30 : 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: (120.0 * _animationReSize?.value)
                            .clamp(30.0, 120.0),
                        child: widget.shoe.images.first,
                      ),
                    ),
                    if (_animationReSize?.value == 1) ...[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.shoe.model.toUpperCase(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '\$${widget.shoe.oldprice}',
                              style: const TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$${widget.shoe.currentprice}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                if (_animationReSize?.value == 1) ...[
                  const SizedBox(height: 50),
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
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
