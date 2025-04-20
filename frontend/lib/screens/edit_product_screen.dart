import 'package:e_commerce_application/model/product/edit_product_model.dart';
import 'package:e_commerce_application/model/product/product_model.dart';
import 'package:e_commerce_application/services/product_service.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  final String productId;
  const EditProductScreen({super.key, required this.productId});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late Product _editingProduct;
  late int _productId;
  late EditProductModel _updatedProduct;
  bool _showFetchButton = false;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _discountPercentageController =
      TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _availabilityStatusController =
      TextEditingController();
  final TextEditingController _minimumOrderQuantityController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _productId = int.tryParse(widget.productId) ?? -1;

    if (_productId != -1) {
      try {
        _editingProduct = sampleProducts.firstWhere(
          (prod) => prod.id == _productId,
        );
        _idController.text = _editingProduct.id.toString();
        _titleController.text = _editingProduct.title;
        _priceController.text = _editingProduct.price.toString();
        _categoryController.text = _editingProduct.category;
        _discountPercentageController.text =
            _editingProduct.discountPercentage.toString();
        _stockController.text = _editingProduct.stock.toString();
        _availabilityStatusController.text = _editingProduct.availabilityStatus;
        _minimumOrderQuantityController.text =
            _editingProduct.minimumOrderQuantity.toString();
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Product not found")));
      }
    } else {
      _showFetchButton = true;
    }
  }

  void _fetchProduct() {
    setState(() {
      _productId = int.tryParse(_idController.text) ?? -1;
      if (_productId != -1) {
        try {
          _editingProduct = sampleProducts.firstWhere(
            (prod) => prod.id == _productId,
          );
          _titleController.text = _editingProduct.title;
          _priceController.text = _editingProduct.price.toString();
          _categoryController.text = _editingProduct.category;
          _discountPercentageController.text =
              _editingProduct.discountPercentage.toString();
          _stockController.text = _editingProduct.stock.toString();
          _availabilityStatusController.text =
              _editingProduct.availabilityStatus;
          _minimumOrderQuantityController.text =
              _editingProduct.minimumOrderQuantity.toString();
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Product not found")));
        }
      }
    });
  }

  void _submit() {
    setState(() {
      _editingProduct.title = _titleController.text;
      _editingProduct.price =
          double.tryParse(_priceController.text) ?? _editingProduct.price;
      _editingProduct.category = _categoryController.text;
      _editingProduct.discountPercentage =
          double.tryParse(_discountPercentageController.text) ??
          _editingProduct.discountPercentage;
      _editingProduct.stock =
          int.tryParse(_stockController.text) ?? _editingProduct.stock;
      _editingProduct.availabilityStatus = _availabilityStatusController.text;
      _editingProduct.minimumOrderQuantity =
          int.tryParse(_minimumOrderQuantityController.text) ??
          _editingProduct.minimumOrderQuantity;
    });
    EditProductModel _updatedProduct = EditProductModel(
      title: _editingProduct.title,
      price: _editingProduct.price,
      category: _editingProduct.category,
      discountPercentage: _editingProduct.discountPercentage,
      stock: _editingProduct.stock,
      availabilityStatus: _editingProduct.availabilityStatus,
      minimumOrderQuantity: _editingProduct.minimumOrderQuantity,
    );

    //Api call for Editing Product
    ProductService().editProduct(_idController.text, _updatedProduct);

    _titleController.clear();
    _priceController.clear();
    _categoryController.clear();
    _discountPercentageController.clear();
    _stockController.clear();
    _availabilityStatusController.clear();
    _minimumOrderQuantityController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Product updated successfully")));
    // print(sampleProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Product',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 69, 6, 241),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_showFetchButton) ...[
              Row(
                children: [
                  SizedBox(
                    width: 200, // Set the desired width
                    child: _buildTextField(_idController, 'Product Id'),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: _fetchProduct,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                    ),
                    child: const Text(
                      "Fetch Product",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              _buildTextField(_idController, 'Product Id'),
            ],
            _buildTextField(_titleController, 'Title'),
            _buildTextField(_priceController, 'Price'),
            _buildTextField(_categoryController, 'Category'),
            _buildTextField(_discountPercentageController, 'Discount %'),
            _buildTextField(_stockController, 'Stock'),
            _buildTextField(
              _availabilityStatusController,
              'Availability Status',
            ),
            _buildTextField(
              _minimumOrderQuantityController,
              'Minimum Order Quantity',
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "Save Changes",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
