
import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/constants/api_endpoints.dart';
import 'package:shop_ease/app/services/network_services/base_api_service.dart';
import 'package:shop_ease/app/services/network_services/network_api_services.dart';

class ProductRepository {
  final BaseApiService _apiService = NetworkApiServices();

  Future<List<ProductModel>> fetchProducts()async{
    try{
      print("dynamic response");
      dynamic response =  await _apiService.getGetApiResponse(ApiEndpoints.productStore).timeout(const Duration(seconds: 5));
      // print("${response}");
      List<ProductModel> productList = (response as List).map(
        (productJson)=> ProductModel.fromJson(productJson)
        ).toList();
      print("product Llist: $productList", );
      return productList;
    }catch(e){
      rethrow;
    }
  }
}