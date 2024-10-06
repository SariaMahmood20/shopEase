abstract class BaseApiService{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(dynamic data, String url);
  Future<dynamic> googleLogin();
  Future<void> googleLogout();
}