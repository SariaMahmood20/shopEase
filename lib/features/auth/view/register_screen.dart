import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_ease/app/views/widgets/button.dart';
import 'package:shop_ease/features/auth/view_model/auth_view_model.dart';
import 'package:shop_ease/features/auth/widgets/auth_row.dart';
import 'package:shop_ease/app/resources/app_strings.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/navigation/route_name.dart';
import 'package:shop_ease/app/utils/utils_function.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstName.dispose();
    _lastName.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppStrings.register,
                          style: styles.sfPro20w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RouteName.login);
                          },
                          child: Text(
                            AppStrings.signin,
                            style: styles.sfPro14w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      AppStrings.newToOpenFashion,
                      style: styles.sfPro14w400,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 215.w,
                      height: 44.h,
                      child: Text(
                        "Register to speed up the checkout process and manage your order",
                        style: styles.sfPro14w400.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            // Use Flexible or Expanded to ensure the text fields
                            // share the space properly and don't overflow
                            Expanded(
                              child: TextFormField(
                                controller: _firstName,
                                decoration: InputDecoration(
                                  hintText: AppStrings.firstName,
                                  hintStyle: styles.sfPro14w400
                                      .copyWith(color: Colors.grey),
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: TextFormField(
                                controller: _lastName,
                                decoration: InputDecoration(
                                  hintText: AppStrings.lastName,
                                  hintStyle: styles.sfPro14w400
                                      .copyWith(color: Colors.grey),
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: AppStrings.emailAddress,
                            hintStyle:
                                styles.sfPro14w400.copyWith(color: Colors.grey),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15.h),
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
                        SizedBox(height: 80.h),
                        Button(
                          onPressed: () {
                            if (_firstName.text.isEmpty) {
                              UtilsFunction.showMessage(
                                  AppStrings.emptyField, context);
                            } else if (_lastName.text.isEmpty) {
                              UtilsFunction.showMessage(
                                  AppStrings.emptyField, context);
                            } else if (_emailController.text.isEmpty) {
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
                                "password": _passwordController.text,
                                "firstName": _firstName.text,
                                "lastName": _lastName.text,
                              };
                              authViewModel.registerApi(data, context);
                            }
                          },
                          text: AppStrings.registerNow,
                        ),
                      ],
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
      ),
    );
  }
}
