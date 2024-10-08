import 'package:flutter/material.dart';
import 'package:shop_ease/app/repository/product_repo.dart';
import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/services/response/api_response.dart';

class ProductViewModel with ChangeNotifier{
  final ProductRepository _productRepo = ProductRepository();

  ApiResponse<ProductModel> productModel = ApiResponse.loading();

  void setProduct(ApiResponse<ProductModel> response){
    productModel = response;
    notifyListeners();
  }

  void fetchProducts()async{
    setProduct(ApiResponse.loading());
    _productRepo.fetchProducts().then((value){
      setProduct(ApiResponse.completed(value as ProductModel?));
    }).onError((stackTrace, error){
      ApiResponse.failed(error.toString());
    });
  }
}