import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shop_ease/app/services/exceptions.dart';
import 'base_api_service.dart';


class NetworkApiServices extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      log("Api Hit");
      print("Api Hit Service");
      final response =await  http.get(Uri.parse(url)).timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    }catch(e){
      rethrow;
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(data, String url) async{
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 3));
      responseJson = returnResponse(response);
    }catch(e){
      rethrow;
    }
    return responseJson;
  }
  

  dynamic returnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        return FetchBadRequestException();
      case 401:
        return FetchUnauthorisedAcessException();
      default:
        return FetchDataException();
    }
  }
  
  @override
  Future googleLogin() async{
    try{
      final GoogleSignIn _googleSignin = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly'
        ]
      );
      final GoogleSignInAccount? googleUser = await _googleSignin.signIn();
      if(googleUser != null){

      }else{

      }
    }catch(e){
      rethrow;
    }
  }
  
  @override
  Future<void> googleLogout() async{
    try{
      GoogleSignIn _googleSignin = GoogleSignIn();
      await _googleSignin.signOut();
    }catch(e){
      rethrow;
    }
  }
  
}