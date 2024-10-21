import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:shop_ease/app/navigation/route.dart';
import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/view_models/product_view_model.dart';
import 'package:shop_ease/app/view_models/user_profile_view_model.dart';
import 'package:shop_ease/features/auth/view_model/auth_view_model.dart';

void main()=> runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>AuthViewModel()),
            ChangeNotifierProvider(create: (_)=>UserProfileViewModel()),
            ChangeNotifierProvider(create: (_)=>ProductViewModel())
            ],
          child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.home,
          onGenerateRoute: Routes.generateRoutes,
                ),
        );
      },

      
    );
  }
}