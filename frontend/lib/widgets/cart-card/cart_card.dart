import 'package:e_commerce_application/model/cart/cart_model.dart';
import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  final CartItemModel cartItem;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  const CartCard({
    super.key,
    required this.cartItem,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late CartItemModel _cartItem;
  late VoidCallback _onDelete;
  late VoidCallback _onIncrease;
  late VoidCallback _onDecrease;

  double get originalPrice =>
      _cartItem.product.price /
      (1 - _cartItem.product.discountPercentage / 100);

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
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Image Section
          Container(
            height: 250,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/product-details/${_cartItem.product.id}',
                    );
                  },
                  child: Image.network(
                    height: 200,
                    width: 100,
                    _cartItem.product.thumbnail,
                    fit: BoxFit.contain,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                            _cartItem.quantity < _cartItem.product.stock
                                ? _onIncrease
                                : null,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Info Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product-details/${_cartItem.product.id}',
                      );
                    },
                    child: Text(
                      _cartItem.product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Text(
                    _cartItem.product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹${_cartItem.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "M.R.P: ₹${(_cartItem.product.price / (1 - _cartItem.product.discountPercentage / 100)).toStringAsFixed(2)} "
                    "(${_cartItem.product.discountPercentage}% off)",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text("Rating: ⭐ ${_cartItem.product.rating} / 5 )"),
                  Text(
                    _cartItem.product.availabilityStatus == "Low Stock"
                        ? "Only ${_cartItem.product.stock} left in stock"
                        : "In stock",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          _cartItem.product.availabilityStatus == "Low Stock"
                              ? Colors.red
                              : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[100],
                        ),
                        child: const Text("Delete"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[100],
                        ),
                        child: const Text("Save for Later"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
