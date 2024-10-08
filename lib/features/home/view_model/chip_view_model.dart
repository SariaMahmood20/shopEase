import 'package:flutter/material.dart';
import 'package:shop_ease/app/repository/product_repo.dart';
import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/services/response/api_response.dart';

class ChipViewModel with ChangeNotifier {
  final ProductRepository _productRepo = ProductRepository();

  // Categories and products list
  List<String> _categories = [];
  List<ProductModel> _products = [];
  List<ProductModel> _filteredProducts = [];

  // API Response state
  ApiResponse<List<ProductModel>> _productResponse = ApiResponse.loading();

  // Getters
  List<String> get categories => _categories;
  List<ProductModel> get filteredProducts => _filteredProducts;
  ApiResponse<List<ProductModel>> get productResponse => _productResponse;

  // Fetch products and categories from repository
  Future<void> fetchProductsAndCategories() async {
    _productResponse = ApiResponse.loading();
    notifyListeners();

    try {
      // Fetch products from repository
      _products = (await _productRepo.fetchProducts()) as List<ProductModel>; // This should now return List<ProductModel>
      _categories = _products.map((product) => product.category).toSet().cast<String>().toList();
      _filteredProducts = _products; // Initially set all products as filtered
      _productResponse = ApiResponse.completed(_products); // Completed with List<ProductModel>
    } catch (e) {
      _productResponse = ApiResponse.failed(e.toString());
    }

    notifyListeners();
  }

  // Filter products based on category
  void filterProductsByCategory(String category) {
    if (category == "All") {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products.where((product) => product.category == category).toList();
    }
    notifyListeners();
  }
}
