import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/resources/app_strings.dart';
import 'package:shop_ease/app/views/widgets/button.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/views/widgets/footer.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              AppStrings.pageNotFound,
              style: styles.sfPro20w600,
            ),
            SizedBox(
              height: 70.h,
            ),
            Column(
              children: [
                SvgPicture.asset(
                  SvgIcons.pageNotFound,
                  height: 72.h,
                  width: 72.w,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "We can't find the page you're looking for, it will return to the ",
                  style: styles.sfPro12w400,
                ),
                SizedBox(height: 30.h),
                Button(
                  onPressed: () {},
                  text: AppStrings.homePage,
                  icon: SvgPicture.asset(SvgIcons.previousPage, color: styles.white,),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
