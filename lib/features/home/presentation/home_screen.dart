import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/widgets/top_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;

  final myitems = [
    Image.asset('assets/images/Mask group@3x.png'),
    Image.asset('assets/images/Mask group5@3x.png'),
    Image.asset('assets/images/Mask group4@3x.png'),
    Image.asset('assets/images/Mask group3@3x.png'),
    Image.asset('assets/images/Mask group2@3x.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Column(
        children: [
          const TopCarousel(),
          SizedBox(
            height: AppSize.defaultSize! * 1.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize!),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: StringManager.myPiles,
                      color: AppColors.blackMedium,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: StringManager.viewAll,
                        color: AppColors.red,
                        decorationColor: AppColors.red,
                        fontWeight: FontWeight.w700,
                        textDecoration: TextDecoration.underline,
                        fontSize: AppSize.defaultSize! * 1.6,
                      ),
                    ),
                  ],
                ),
                MiddleCarouselCard(),
                // CarouselSlider(
                //   options: CarouselOptions(
                //       viewportFraction: 2,
                //       height: 100,
                //       onPageChanged: (index, reason) {
                //         setState(() {
                //           myCurrentIndex = index;
                //         });
                //       }),
                //   items: myitems,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
