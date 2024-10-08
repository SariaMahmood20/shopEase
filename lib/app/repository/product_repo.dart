import 'dart:convert';

import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/constants/api_endpoints.dart';
import 'package:shop_ease/app/services/network_services/base_api_service.dart';
import 'package:shop_ease/app/services/network_services/network_api_services.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    final BaseApiService _apiService = NetworkApiServices();
    final response = await _apiService.getGetApiResponse(ApiEndpoints.productStore).timeout(const Duration(seconds: 5));
    final data = jsonDecode(response) as List;
    return data.map((product) => ProductModel.fromJson(product)).toList();
  }
}