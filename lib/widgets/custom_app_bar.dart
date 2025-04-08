import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _searchInputController = TextEditingController();

  void _searchProduct() {
    print(_searchInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: const Text(
          "KarthiKart",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: 220,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _searchInputController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: _searchProduct,
                  icon: Icon(Icons.search),
                ),
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          icon: const Icon(Icons.login, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            // TODO: Add logout logic
          },
          icon: const Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}
