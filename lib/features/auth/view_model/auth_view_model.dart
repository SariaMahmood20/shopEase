import 'package:flutter/material.dart';
import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/repository/auth_repo.dart';
import 'package:shop_ease/app/utils/utils_function.dart';

class AuthViewModel with ChangeNotifier{
  final AuthRepo _authRepo = AuthRepo();
  Future<void> loginApi(dynamic data, BuildContext context)async{
    _authRepo.loginApi(data).then((value)async{
       Navigator.pushReplacementNamed(context, RouteName.home);
    }).onError((stackTrace, error){
      UtilsFunction.showMessage("Wrong Credentials", context);
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context)async{
    _authRepo.registerApi(data).then((value)async{
       Navigator.pushReplacementNamed(context, RouteName.home);
    }).onError((stackTrace, error){
      UtilsFunction.showMessage("Error while communcating with server", context);
    });
  }
}



