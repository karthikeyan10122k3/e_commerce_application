import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:e_commerce_application/widgets/product-card/horizontal_product_card.dart';
import 'package:e_commerce_application/widgets/product-card/vertical_product_card.dart';
import 'package:flutter/material.dart';

class ProductsDisplayScreen extends StatelessWidget {
  ProductsDisplayScreen({Key? key}) : super(key: key);

  final List<String> horizontalCardCategory = [
    "smartphones",
    "laptops",
    "automotive",
    "motorcycle",
    "home-decoration",
    "furniture",
    "lighting",
  ];

  bool isHorizontalProduct(String category) {
    return horizontalCardCategory.contains(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final product = sampleProducts[index];
          final isHorizontal = isHorizontalProduct(product.category);

          if (isHorizontal) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HorizontalProductCard(product: product),
            );
          } else {
            // 2 items per row (vertical card)
            // Check if next product exists and is also vertical
            final nextIndex = index + 1;
            final nextIsValid =
                nextIndex < sampleProducts.length &&
                !isHorizontalProduct(sampleProducts[nextIndex].category);

            if (nextIsValid) {
              final nextProduct = sampleProducts[nextIndex];
              // skip rendering the next item separately
              index++;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: VerticalProductCard(product: product)),
                    SizedBox(width: 10),
                    Expanded(child: VerticalProductCard(product: nextProduct)),
                  ],
                ),
              );
            } else {
              // Only one vertical item left, display alone
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalProductCard(product: product),
              );
            }
          }
        },
      ),
    );
  }
}
