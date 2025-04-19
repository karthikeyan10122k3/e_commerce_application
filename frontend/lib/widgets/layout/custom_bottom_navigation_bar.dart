import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex,
      onTap: onTap,
      // backgroundColor: Color.fromARGB(255, 69, 6, 241),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color.fromARGB(255, 69, 6, 241),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "You",
          backgroundColor: Color.fromARGB(255, 69, 6, 241),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
          backgroundColor: Color.fromARGB(255, 69, 6, 241),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
          backgroundColor: Color.fromARGB(255, 69, 6, 241),
        ),
      ],
    );
  }
}
