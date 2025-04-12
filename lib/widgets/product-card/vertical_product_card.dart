import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:flutter/material.dart';

class VerticalProductCard extends StatelessWidget {
  final Product product;
  const VerticalProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool _isInCart = false;
    void _onAddToCart() {}

    void _onRemoveFromCart() {}

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.thumbnail,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 6),
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
                const SizedBox(height: 8),
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
        ],
      ),
    );
    ;
  }
}
