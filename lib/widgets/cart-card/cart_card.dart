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
                      '/product-details/${_cartItem.itemId}',
                    );
                  },
                  child: Image.network(
                    height: 200,
                    width: 100,
                    _cartItem.thumbnail,
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
                        '/product-details/${_cartItem.itemId}',
                      );
                    },
                    child: Text(
                      _cartItem.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Text(
                    _cartItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹${_cartItem.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "M.R.P: ₹${(_cartItem.price / (1 - _cartItem.discountPercentage / 100)).toStringAsFixed(2)} "
                    "(${_cartItem.discountPercentage}% off)",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text("Rating: ⭐ ${_cartItem.rating} / 5 )"),
                  Text(
                    _cartItem.availabilityStatus == "Low Stock"
                        ? "Only ${_cartItem.stock} left in stock"
                        : "In stock",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          _cartItem.availabilityStatus == "Low Stock"
                              ? Colors.red
                              : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "🚚 ${_cartItem.shippingInformation}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
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
