import 'package:e_commerce_application/model/cart/cart_product_model.dart';
import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final CartProductModel cartItem;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  const CartCard({
    Key? key,
    required this.cartItem,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late CartProductModel _cartItem;
  late VoidCallback _onDelete;
  late VoidCallback _onIncrease;
  late VoidCallback _onDecrease;

  double get originalPrice =>
      _cartItem.price / (1 - _cartItem.discountPercentage / 100);

  @override
  void initState() {
    super.initState();
    _cartItem = widget.cartItem;
    _onDelete = widget.onDelete;
    _onIncrease = widget.onIncrease;
    _onDecrease = widget.onDecrease;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product-details/${_cartItem.itemId}',
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    _cartItem.thumbnail,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Row(
                  children: [
                    _cartItem.quantity == 1
                        ? IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: _onDelete,
                          iconSize: 20,
                        )
                        : IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed:
                              _cartItem.quantity > 1 ? _onDecrease : null,
                          iconSize: 20,
                        ),
                    Text(
                      '${_cartItem.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed:
                          _cartItem.quantity < _cartItem.stock
                              ? _onIncrease
                              : null,
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product-details/${_cartItem.itemId}',
                      );
                    },
                    child: Text(
                      _cartItem.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              if (_cartItem.availabilityStatus == "In Stock")
                const Text(
                  "In stock",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (_cartItem.availabilityStatus == "Low Stock")
                Text(
                  "Only ${_cartItem.stock} left in stock",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 4),
              const Text(
                "Eligible for free Shipping 🚚",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 8),

              // Quantity Controls and Actions
              Row(
                children: [
                  // Quantity Control

                  // Other Actions
                  TextButton(
                    onPressed: _onDelete,
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Save for later"),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "-${_cartItem.discountPercentage}%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "₹${_cartItem.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "M.R.P: ₹${originalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),

              // Stock Warnings
              if (_cartItem.quantity >= _cartItem.stock)
                Text(
                  "This Seller only has ${_cartItem.stock} of these available",
                  style: const TextStyle(color: Colors.orange),
                ),

              if (_cartItem.quantity >= _cartItem.minimumOrderQuantity)
                Text(
                  "This Seller has a limit of ${_cartItem.minimumOrderQuantity} per customer",
                  style: const TextStyle(color: Colors.orange),
                ),
            ],
          ),

          // Price
        ],
      ),
    );
  }
}
