import 'dart:convert';

import 'package:e_commerce_application/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final ProductService _productService = ProductService();

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.https("localhost:8080", "/api/product"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List productsJson = data['products'];
        _products = productsJson.map((json) => Product.fromJson(json)).toList();
        print(_products);

        _errorMessage = '';
      } else {
        _errorMessage = "Failed to load products: ${response.body}";
      }
    } catch (error) {
      _errorMessage = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
