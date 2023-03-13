import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:aprendizaje/multiple_card/datos.dart';
import 'package:aprendizaje/multiple_card/detail.dart';

const titleStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22);
const subTitleStyle =
    TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);

const bgGradiant = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff4b6089), Color(0xff9fd4d2)]);

class MultipleCardFlow extends StatefulWidget {
  const MultipleCardFlow({super.key});

  @override
  State<MultipleCardFlow> createState() => _MultipleCardFlowState();
}

class _MultipleCardFlowState extends State<MultipleCardFlow>
    with TickerProviderStateMixin {
  final _pageController = PageController(viewportFraction: 0.8);
  double page = 0.0;
  AnimationController? _animationControler;

  @override
  void initState() {
    _animationControler = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 1200));
    _pageController.addListener(_lisenScroll);
    super.initState();
  }

  void _lisenScroll() {
    setState(() {
      page = _pageController.page!;
    });
  }

  void _onSwipe(City city) async {
    _animationControler?.forward();
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (context, _, __) => DetailPage(city: city),
        transitionsBuilder: (context, animation, _, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
    _animationControler?.reverse();
  }

  @override
  void dispose() {
    _animationControler?.dispose();
    _pageController.removeListener(_lisenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child:
                DecoratedBox(decoration: BoxDecoration(gradient: bgGradiant))),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextField(_animationControler!),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt,
                              size: 30, color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      // print(page);
                      final city = cities[index];
                      final porcent = (page - index).abs().clamp(0.0, 1.0);
                      // final factor =
                      //     _pageController.position.userScrollDirection ==
                      //             ScrollDirection.forward
                      //         ? 1.0
                      //         : -1.0;
                      final opacity = porcent.clamp(0.0, 0.9);
                      return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(vector.radians(45 * porcent)),
                          child: Opacity(
                              opacity: (1 - opacity),
                              child: CityItemWidget(
                                city: city,
                                onSwipe: () {
                                  _onSwipe(city);
                                },
                              )));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyTextField extends AnimatedWidget {
  const MyTextField(Animation<double> animation, {super.key})
      : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final value = 1 - animation.value;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40,
        width: size.width * value,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.shade200,
        ),
        child: value > 0.4
            ? Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(Icons.search, color: Colors.white, size: 28),
                  SizedBox(width: 20),
                  Text(
                    'Buscar...',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class CityItemWidget extends StatelessWidget {
  const CityItemWidget({super.key, required this.city, required this.onSwipe});
  final City city;
  final VoidCallback onSwipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < -7) {
          onSwipe();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: CityWidget(city: city),
            ),
            const Spacer(),
            Expanded(flex: 5, child: BottomPanel(city: city))
          ],
        ),
      ),
    );
  }
}

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    Key? key,
    required this.city,
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bottom_panel${city.nombre}",
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(city.nombre,
                            style: titleStyle.copyWith(color: Colors.black45)),
                        Text(city.nombre,
                            style: subTitleStyle.copyWith(
                                color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(city.nombre,
                  style:
                      titleStyle.copyWith(color: Colors.black45, fontSize: 16)),
              Text(city.nombre,
                  style:
                      subTitleStyle.copyWith(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 15),
              const Text(
                  "Descripcion ajsndk anj ksdnbk as bdkan sdka sdn kasd  asnd",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 10),
              Expanded(
                child: Image.asset(
                  city.image,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Descripcion ajsndk anj ksdnbk as ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class CityWidget extends StatelessWidget {
  const CityWidget(
      {Key? key, required this.city, this.padding = EdgeInsets.zero})
      : super(key: key);
  final EdgeInsets padding;
  final City city;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "city_${city.nombre}",
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        child: Stack(children: [
          Positioned.fill(
            child: Image.asset(city.image, fit: BoxFit.cover),
          ),
          Padding(
            padding: padding,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(city.nombre, style: titleStyle),
                        Text(city.price, style: titleStyle),
                        const Spacer(),
                        Text(city.nombre, style: subTitleStyle),
                        Text(city.nombre,
                            style: subTitleStyle.copyWith(fontSize: 15)),
                        // Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.flight_takeoff,
                          size: 60,
                          color: Colors.white70,
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white70)),
                          child: const Text(
                            'Example',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
