import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_ease/app/resources/app_strings.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
// import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/constants/svg_icons.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.about,
                style: styles.sfPro16w400,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.contact,
                style: styles.sfPro16w400,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppStrings.blog,
                style: styles.sfPro16w400,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "support@stylesage.design",
          style: styles.sfPro16w400.copyWith(color: Colors.grey),
        ),
        Text(
          "(229) 555-0109",
          style: styles.sfPro16w400.copyWith(color: Colors.grey),
        ),
        Text(
          "07:00 - 21:00 - Everyday",
          style: styles.sfPro16w400.copyWith(color: Colors.grey),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 132.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(
                SvgIcons.youtube,
                width: 24.w,
                height: 24.h,
              ),
              SvgPicture.asset(
                SvgIcons.instagram,
                width: 24.w,
                height: 24.h,
              ),
              SvgPicture.asset(
                SvgIcons.twitter,
                width: 24.w,
                height: 24.h,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          AppStrings.copyRight,
          style: styles.sfPro12w400.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
