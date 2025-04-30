import 'package:e_commerce_application/model/item/item_model.dart';

class OrderItemModel {
  final Item product;
  final int quantity;

  OrderItemModel({required this.product, required this.quantity});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
    product: Item.fromJson(json['product']),
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
  };
}
