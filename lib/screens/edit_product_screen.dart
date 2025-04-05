import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  final String productId;
  const EditProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product Screen Title')),
      body: Center(child: Text("Edit Product Screen Body")),
    );
  }
}
