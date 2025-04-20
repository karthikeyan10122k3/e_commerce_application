import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:e_commerce_application/services/product_service.dart';
import 'package:e_commerce_application/widgets/product-card/horizontal_product_card.dart';
import 'package:e_commerce_application/widgets/product-card/vertical_product_card.dart';
import 'package:flutter/material.dart';

class ProductsDisplayScreen extends StatefulWidget {
  const ProductsDisplayScreen({super.key});

  @override
  State<ProductsDisplayScreen> createState() => _ProductsDisplayScreenState();
}

class _ProductsDisplayScreenState extends State<ProductsDisplayScreen> {
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

  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = ProductService().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products found."));
          }

          final products = snapshot.data!;
          List<Widget> productWidgets = [];

          for (int i = 0; i < products.length; i++) {
            final product = products[i];
            final isHorizontal = isHorizontalProduct(product.category);

            if (isHorizontal) {
              productWidgets.add(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HorizontalProductCard(product: product),
                ),
              );
            } else {
              final nextIndex = i + 1;
              final canPair =
                  nextIndex < products.length &&
                  !isHorizontalProduct(products[nextIndex].category);

              if (canPair) {
                productWidgets.add(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: VerticalProductCard(product: product)),
                        SizedBox(width: 10),
                        Expanded(
                          child: VerticalProductCard(
                            product: products[nextIndex],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                i++; // skip next index as it's paired
              } else {
                productWidgets.add(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VerticalProductCard(product: product),
                  ),
                );
              }
            }
          }

          return ListView(children: productWidgets);
        },
      ),
    );
  }
}
