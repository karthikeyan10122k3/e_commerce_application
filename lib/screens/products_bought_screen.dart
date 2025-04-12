import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductsBoughtScreen extends StatelessWidget {
  const ProductsBoughtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Previous Purchases by User')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Previous Purchases",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final sampleProduct = sampleProducts[index];
                return Card(
                  color: Colors.red.shade100,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sampleProduct.title),
                        Text(sampleProduct.category),
                        Text('\$${sampleProduct.price}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
