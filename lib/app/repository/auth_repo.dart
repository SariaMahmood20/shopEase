import 'package:shop_ease/app/services/network_services/network_api_services.dart';
import 'package:shop_ease/app/services/network_services/base_api_service.dart';
import 'package:shop_ease/app/constants/api_endpoints.dart';

class AuthRepo{

  final BaseApiService _apiService = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(data, ApiEndpoints.loginApi);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiService.getPostApiResponse(data, ApiEndpoints.registerApi);
      return response;
    }catch (e){
      rethrow;
    }
  }
}