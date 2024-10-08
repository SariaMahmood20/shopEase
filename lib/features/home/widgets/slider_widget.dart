import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/app/views/widgets/button.dart';
import 'package:shop_ease/app/resources/app_strings.dart';

class SliderWidget extends StatelessWidget {
  static List<String> listOfItems = [
    "https://i.imgur.com/R2PN9Wq.jpeg",
    "https://i.imgur.com/cSytoSD.jpeg",
    "https://i.imgur.com/cHddUCu.jpeg",
  ];

  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Stack(
        children: [
          // Full screen height carousel slider
          CarouselSlider.builder(
            itemCount: listOfItems.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(listOfItems[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height, // Full screen height
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1.0, // Full-screen image display
            ),
          ),
          // Positioned button at the top-center of the slider
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Button(
                  onPressed: () {
                    // Implement your button logic here
                  },
                  text: AppStrings.viewCollection,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
