import 'package:flutter/material.dart';
import 'package:shop_ease/app/repository/user_profile_repo.dart';
import 'package:shop_ease/app/models/user_profile_model.dart';
import 'package:shop_ease/app/services/response/api_response.dart';

class UserProfileViewModel with ChangeNotifier {

  final UserProfileRepo _userProfileRepo = UserProfileRepo();

  ApiResponse<UserProfileModel> userProfile = ApiResponse.loading();

  void setUserProfile(ApiResponse<UserProfileModel> response) {
    userProfile = response;
    notifyListeners();
  }

  // Fetch user profile from the API
  void fetchUserProfileApi() async {
    setUserProfile(ApiResponse.loading());
    _userProfileRepo.fetchUserProfile().then((data) {
      setUserProfile(ApiResponse.completed(data));
    }).onError((error, stackTrace) {
      setUserProfile(ApiResponse.failed(error.toString()));
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }
}