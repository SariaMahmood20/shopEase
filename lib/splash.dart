import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/view_models/user_sessions.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    UserSessions.checkAuthentication(context);
    Timer(const Duration(seconds: 2), (){setState(() {
      opacity = 0.0;
    });});
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity, 
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgIcons.logo,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(height: 8.h,),
              Text(
                "Welcome to the StyleSage!",
                style: styles.sfPro20w400,
              )
            ],
          )
          )
      ),
    );
  }
}