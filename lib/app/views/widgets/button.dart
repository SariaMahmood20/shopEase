import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_ease/app/resources/app_theme.dart';

class Button extends StatelessWidget {
  final icon;
  final String? text;
  final VoidCallback onPressed;
  const Button({super.key, required this.onPressed, @required this.text, this.icon});



  @override
  Widget build(BuildContext context) {
    final styles  = Theme.of(context).extension<AppTheme>()!;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          color: styles.orangeColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            icon?? const SizedBox(height: 0.0, width: 0.0,),
            SizedBox(width: 10.w,),
            Text(
              textAlign: TextAlign.center,
              text.toString(),
              style: styles.sfPro16w400.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}