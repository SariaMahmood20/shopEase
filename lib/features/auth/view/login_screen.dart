import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/resources/app_strings.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/views/widgets/button.dart';
import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/utils/utils_function.dart';
import 'package:shop_ease/features/auth/view_model/auth_view_model.dart';
import 'package:shop_ease/features/auth/widgets/auth_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the AuthViewModel instance from the Provider
    final authViewModel = Provider.of<AuthViewModel>(context);
    final styles = Theme.of(context).extension<AppTheme>()!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SvgPicture.asset(
            SvgIcons.logo,
            width: 108.w,
            height: 20.h,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppStrings.signin,
                        style: styles.sfPro20w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.register);
                        },
                        child: Text(
                          AppStrings.register,
                          style: styles.sfPro14w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.haveAnAccount,
                        style: styles.sfPro14w400,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 215.w,
                        height: 44.h,
                        child: Text(
                          "Sign in to speed up the checkout process and manage your orders",
                          style:
                              styles.sfPro14w400.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: AppStrings.emailAddress,
                        hintStyle:
                            styles.sfPro14w400.copyWith(color: Colors.grey)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: AppStrings.password,
                      hintStyle:
                          styles.sfPro14w400.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(AppStrings.forgotPassword),
                  SizedBox(height: 130.h),
                  Button(
                    onPressed: (){
                      if (_emailController.text.isEmpty) {
                        print("Email Error");
                        UtilsFunction.showMessage(
                            AppStrings.enterEmail, context);
                      } else if (_passwordController.text.isEmpty) {
                        UtilsFunction.showMessage(
                            AppStrings.enterPassword, context);
                      } else if (_passwordController.text.length < 6) {
                        UtilsFunction.showMessage(
                            AppStrings.shortPassword, context);
                      } else {
                        Map data = {
                          "email": _emailController.text,
                          "password": _passwordController.text
                        };
                        authViewModel.loginApi(data, context);
                      }
                    },
                    text: AppStrings.signin,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
              Text(
                AppStrings.or,
                style: styles.sfPro16w600,
              ),
              SizedBox(height: 30.h),
              const AuthRow(),
            ],
          ),
        ),
      ),
    );
  }
}
