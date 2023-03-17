import 'package:aprendizaje/custom_bottom_navi_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNaviBar extends StatelessWidget {
  const CustomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink.shade50,
      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          color: Colors.blue,
          index: 1,
          items: const [
            Icon(Icons.home_outlined),
            Icon(Icons.account_circle_outlined),
            Icon(Icons.api_outlined),
          ],
          onTap: (index) {}),
    );
  }
}
