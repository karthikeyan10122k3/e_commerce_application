import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:e_commerce_application/widgets/custom_app_bar.dart';
import 'package:e_commerce_application/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
        ),

        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final product = sampleProducts[index];
          return Card(
            color: Colors.red.shade100,
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title),
                  Text(product.category),
                  Text('\$${product.price}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
