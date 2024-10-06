import 'package:shop_ease/app/models/user_profile_model.dart';
import 'package:shop_ease/app/services/network_services/base_api_service.dart';
import 'package:shop_ease/app/services/network_services/network_api_services.dart';
import 'package:shop_ease/app/constants/api_endpoints.dart';

class UserProfileRepo{
  final BaseApiService _apiService = NetworkApiServices();
  Future<UserProfileModel> fetchUserProfile() async{
    try{
      print("Fetching User Data");
      dynamic response = await _apiService.getGetApiResponse(ApiEndpoints.userApi).timeout(const Duration(seconds: 5));
      print("Got the User Profile");
      return response = UserProfileModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}
