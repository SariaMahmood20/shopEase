import 'package:flutter/material.dart';

import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/view_models/user_view_model.dart';

class UserSessions{
  static void checkAuthentication(BuildContext context)async{
    final userViewModel = UserViewModel();
    final user = await userViewModel.getUser();
    if(user!.token.toString() == "null" || user!.token.toString() == ""){
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacementNamed(context, RouteName.login);
    }else{
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacementNamed(context, RouteName.home);
    }
  }
}