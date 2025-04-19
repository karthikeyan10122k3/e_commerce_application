import 'package:e_commerce_application/model/cart/cart_product_model.dart';
import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:e_commerce_application/widgets/cart-card/cart_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _proceedToBuy() {}

  String get _getSubTotal {
    double subTotal = sampleProducts.fold(
      0,
      (currentSum, product) => currentSum + product.price,
    );
    String subTotalString = subTotal.toStringAsFixed(2);
    return subTotalString;
  }

  void _onDelete() {}
  void _onDecrease() {}
  void _onIncrease() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 5,
                right: 5,
                bottom: 5,
                top: 15,
              ),
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width, // Full width
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Subtotal ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "\$$_getSubTotal",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _proceedToBuy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Proceed To Buy (${sampleProducts.length})",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 5,
                bottom: 5,
                top: 0,
              ),
              child: const Text(
                "Your Cart Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: sampleCartProducts.length,
              itemBuilder: (context, index) {
                final product = sampleCartProducts[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: CartCard(
                    cartItem: product,
                    onDelete: _onDelete,
                    onIncrease: _onIncrease,
                    onDecrease: _onDecrease,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
