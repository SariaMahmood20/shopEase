import 'package:shop_ease/app/models/products_model.dart';
import 'package:shop_ease/app/constants/api_endpoints.dart';
import 'package:shop_ease/app/services/exceptions.dart';
import 'package:shop_ease/app/services/network_services/base_api_service.dart';
import 'package:shop_ease/app/services/network_services/network_api_services.dart';

class ProductRepository {
  final BaseApiService _apiService = NetworkApiServices();

  Future<List<dynamic>> fetchProductsList() async {
    try {
      // Make an API call to get the list of products
      dynamic response = await _apiService
          .getGetApiResponse(ApiEndpoints.productStore)
          .timeout(const Duration(seconds: 10));
        print("$response");

      // Validate that the response is a list and map it to ProductModel instances
      if (response is List) {
        print("Response is list");
        return response
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
            
      } else {
        throw FetchDataException("Unexpected response format");
      }
    } catch (e) {
      print("Error fetching products: $e");
      rethrow;
    }
  }
}
