import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinteresLayoutPage extends StatefulWidget {
  const PinteresLayoutPage({super.key});

  @override
  State<PinteresLayoutPage> createState() => _PinteresLayoutPageState();
}

class _PinteresLayoutPageState extends State<PinteresLayoutPage> {
  final ScrollController _controller = ScrollController();
  double scrollAnterior = 0.0;
  final mostrar = ValueNotifier(true);

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  void _listener() {
    if (_controller.offset > scrollAnterior && _controller.offset > 0) {
      mostrar.value = false;
    } else {
      mostrar.value = true;
    }
    scrollAnterior = _controller.offset;
    // setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MasonryGridView.count(
            controller: _controller,
            itemCount: 200,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return Tile(
                index: index,
                extent: (index % 5 + 1) * 100,
              );
            },
          ),
          Positioned(
            bottom: 30,
            child: ValueListenableBuilder(
              valueListenable: mostrar,
              builder: (BuildContext context, bool value, _) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: mostrar.value ? 1 : 0,
                  child: _MenuBottom(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MenuBottom extends StatefulWidget {
  const _MenuBottom({Key? key}) : super(key: key);

  @override
  State<_MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<_MenuBottom> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    late List<Widget> items = [
      Icon(
        Icons.home,
        size: index == 0 ? 26 : 24,
        color: index == 0 ? Colors.black : Colors.grey,
      ),
      Icon(
        Icons.home,
        size: index == 1 ? 26 : 24,
        color: index == 1 ? Colors.black : Colors.grey,
      ),
      Icon(
        Icons.home,
        size: index == 2 ? 26 : 24,
        color: index == 2 ? Colors.black : Colors.grey,
      ),
      Icon(
        Icons.home,
        size: index == 3 ? 26 : 24,
        color: index == 3 ? Colors.black : Colors.grey,
      ),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, spreadRadius: -5)
              ],
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: items
                .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          index = items.indexOf(e);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: e,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

const _defaultColor = Color(0xFF34568B);

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? _defaultColor,
          borderRadius: BorderRadius.circular(10)),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
