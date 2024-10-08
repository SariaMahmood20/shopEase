import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chip_list/chip_list.dart';
import 'package:provider/provider.dart';

import 'package:shop_ease/app/views/widgets/my_appbar.dart';
import 'package:shop_ease/app/view_models/product_view_model.dart';
import 'package:shop_ease/app/constants/svg_icons.dart';
import 'package:shop_ease/app/resources/app_strings.dart';
import 'package:shop_ease/app/resources/app_theme.dart';
import 'package:shop_ease/features/home/widgets/slider_widget.dart';
import 'package:shop_ease/app/views/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final _productViewModel = Provider.of<ProductViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppbar(),
        body: Column(
          children: [
            const SliderWidget(),
            SizedBox(height: 50.h,),
            Text(
              AppStrings.newOnes,
              style: styles.sfPro20w600,
              textAlign: TextAlign.center,
            ),
            ChipList(listOfChipNames: listOfChipNames, listOfChipIndicesCurrentlySelected: listOfChipIndicesCurrentlySelected)
          ],
        ),
        drawer: DrawerWidget(),
      ),
    );
    
  }
}