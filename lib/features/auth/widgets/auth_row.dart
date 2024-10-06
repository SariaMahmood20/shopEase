import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_ease/app/constants/svg_icons.dart';

class AuthRow extends StatelessWidget {
  const AuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            SvgIcons.googleSignIn,
            height: 50.h,
            width: 50.h,
          ),
          SvgPicture.asset(
            SvgIcons.appleLogin,
            height: 50.h,
            width: 50.w,
          ),
          SvgPicture.asset(
            SvgIcons.twitterLogin,
            height: 50.h,
            width: 50.w,
          )
        ],
      ),
    );
  }
}