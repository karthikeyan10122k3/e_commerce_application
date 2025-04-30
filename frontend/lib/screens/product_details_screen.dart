import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Product _product;
  late String _productId;
  late bool _isInCart;

  void _addItemToCart() {}

  void _buyItem() {}

  @override
  void initState() {
    super.initState();
    _productId = widget.productId;

    _product = sampleProducts.firstWhere(
      (prod) => prod.id == _productId,
      orElse: () => throw Exception("Product not found"),
    );

    _isInCart = sampleProducts.any((item) => item.id == _productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _Product Image & Thumbnails
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main Image & Thumbnails
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Image.network(
                        _product.thumbnail,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _product.images.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              _product.images[index],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // _Product Details
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _product.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${_product.brand} | SKU: ${_product.sku}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),

                      // Price
                      Row(
                        children: [
                          Text(
                            "₹${_product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "(-${_product.discountPercentage}%)",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Availability
                      Text(
                        "Availability: ${_product.availabilityStatus} (${_product.stock} in stock)",
                        style: TextStyle(
                          color:
                              _product.availabilityStatus == 'Low Stock'
                                  ? Colors.red
                                  : Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Rating
                      Text("⭐ ${_product.rating}/5"),

                      const SizedBox(height: 6),

                      // Other Info
                      Text("Category: ${_product.category}"),
                      const SizedBox(height: 6),
                      Row(
                        children:
                            _product.tags
                                .map(
                                  (tag) => Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Chip(label: Text(tag)),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 10),

                      Text(_product.description),
                      const SizedBox(height: 5),

                      Text("Weight: ${_product.weight}g"),
                      const SizedBox(height: 5),
                      Text(
                        "Dimensions: ${_product.dimensions.width} x ${_product.dimensions.height} x ${_product.dimensions.depth} cm",
                      ),
                      const SizedBox(height: 5),
                      Text("Warranty: ${_product.warrantyInformation}"),
                      const SizedBox(height: 5),
                      Text("Shipping: ${_product.shippingInformation}"),
                      const SizedBox(height: 5),
                      Text("Return Policy: ${_product.returnPolicy}"),
                      const SizedBox(height: 5),
                      Text(
                        "Minimum Order Quantity: ${_product.minimumOrderQuantity}",
                      ),

                      const SizedBox(height: 10),

                      Text("Barcode: ${_product.meta.barcode}"),
                      Image.network(_product.meta.qrCode),

                      const SizedBox(height: 20),

                      // Buttons
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _buyItem,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          _isInCart
                              ? ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent,
                                ),
                                child: const Text(
                                  "In Cart",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              : ElevatedButton(
                                onPressed: _addItemToCart,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent,
                                ),
                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Reviews Section
            const Text(
              "Customer Reviews",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._product.reviews.map((review) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${review.reviewerName} (⭐ ${review.rating}/5)",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(review.comment),
                  Text(
                    "Date: ${review.date}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Divider(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
