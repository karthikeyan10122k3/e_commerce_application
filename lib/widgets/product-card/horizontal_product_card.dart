import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:flutter/material.dart';

class HorizontalProductCard extends StatelessWidget {
  final Product product;
  const HorizontalProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool _isInCart = false;

    void _onAddToCart() {}

    void _onRemoveFromCart() {}

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Image Section
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.all(8),
            child: Image.network(product.thumbnail, fit: BoxFit.cover),
          ),
          // Info Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "M.R.P: ₹${(product.price / (1 - product.discountPercentage / 100)).toStringAsFixed(2)} "
                    "(${product.discountPercentage}% off)",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "Rating: ⭐ ${product.rating} / 5 (${product.reviews.length} reviews)",
                  ),
                  Text(
                    product.availabilityStatus == "Low Stock"
                        ? "Only ${product.stock} left in stock"
                        : "In stock",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          product.availabilityStatus == "Low Stock"
                              ? Colors.red
                              : Colors.green,
                    ),
                  ),
                  Text(
                    "🚚 ${product.shippingInformation}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  _isInCart
                      ? ElevatedButton(
                        onPressed: _onRemoveFromCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Remove from Cart"),
                      )
                      : ElevatedButton(
                        onPressed: _onAddToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text("Add to Cart"),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
