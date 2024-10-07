import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_ease/app/views/widgets/my_appbar.dart';
import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/views/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // appBar:
        appBar: MyAppbar(),
        body: Center(
          child: Text("Home Screen"),
        ),
        drawer: DrawerWidget(),
      ),
    );
    
  }
}