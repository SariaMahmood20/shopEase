import 'package:flutter/material.dart';
import 'package:shop_ease/app/repository/product_repo.dart';
import 'package:shop_ease/app/services/response/api_response.dart';

class ProductViewModel with ChangeNotifier {

  final ProductRepository _productRepo = ProductRepository();

  // Store the product list in an ApiResponse to handle different states (loading, completed, failed)
  ApiResponse<List<dynamic>> productsList = ApiResponse.loading();

  // Set product data and notify listeners
  void _setProduct(ApiResponse<List<dynamic>> response) {
    productsList = response;
    notifyListeners();
  }

  // Fetch the products from the repository
  Future<void> fetchProducts() async {
    _setProduct(ApiResponse.loading());  // Set loading state
    try {
      List<dynamic> products = await _productRepo.fetchProductsList();
      _setProduct(ApiResponse.completed(products));  // Set completed state with data
    } catch (e) {
      _setProduct(ApiResponse.failed(e.toString()));  // Set error state
    }
  }
}
