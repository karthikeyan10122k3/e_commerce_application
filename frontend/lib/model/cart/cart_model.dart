import 'package:e_commerce_application/model/item/item_model.dart';

class CartItemModel {
  final Item product;
  final int quantity;

  CartItemModel({required this.product, required this.quantity});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    product: Item.fromJson(json['product']),
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
  };
}

List<CartItemModel> sampleCartProducts = [
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
  CartItemModel(
    product: Item(
      id: "1",
      title: "Essence Mascara Lash Princess",
      description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      price: 9.99,
      stock: 5,
      discountPercentage: 7.17,
      rating: 4.94,
      availabilityStatus: "Low Stock",
      minimumOrderQuantity: 24,
      thumbnail:
          "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
    ),
    quantity: 1,
  ),
];
