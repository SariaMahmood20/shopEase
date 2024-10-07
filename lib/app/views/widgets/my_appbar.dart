import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_ease/app/constants/svg_icons.dart';

class MyAppbar extends StatelessWidget implements PreferredSize{
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        SvgIcons.logo,
        width: 108.w,
        height: 20.h,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: (){},
          child: SvgPicture.asset(
            SvgIcons.search,
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(width: 20.w,),
        GestureDetector(
          onTap: (){},
          child: SvgPicture.asset(
            SvgIcons.cart,
            height: 24.h,
            width: 24.w,
          ),
        ),
        SizedBox(width: 20.w,)
      ],
    );
  }
      @override
      // TODO: implement child
      Size get preferredSize => Size.fromHeight(56.h);
      
        @override
        // TODO: implement child
        Widget get child => throw UnimplementedError();
}