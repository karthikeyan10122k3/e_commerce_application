import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text('Search'),
            SizedBox(width: 8),
            Icon(Icons.search_rounded),
            Spacer(),
            Text('Login'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            const Text("Home Screen Body"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/product-detail/2');
              },
              child: const Text(
                'Go to product-detail Screen',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-product');
              },
              child: const Text(
                'Go to Add Product Screen',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edit-product/2');
              },
              child: const Text(
                'Go to Edit Product Screen',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
