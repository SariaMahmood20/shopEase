import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease/features/auth/view/register_screen.dart';
import 'package:shop_ease/features/home/view/home_screen.dart';

import 'package:shop_ease/splash.dart';
import 'package:shop_ease/app/views/page_not_found.dart';
import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/features/auth/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomeScreen());
      case RouteName.register:
        return MaterialPageRoute(builder: (BuildContext context)=>const RegisterScreen());
      default:
        // Return PageNotFoundScreen in case of an undefined route.
        return MaterialPageRoute(builder: (BuildContext context) => const PageNotFoundScreen());
    }
  }
}
