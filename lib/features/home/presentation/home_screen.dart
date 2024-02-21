
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/blogs/presentation/blog_screen.dart';
import 'package:pile_up/features/blogs/presentation/widgets/blog_details.dart';
import 'package:pile_up/features/home/presentation/components/Piles%20Details/piles_details.dart';
import 'package:pile_up/features/home/presentation/widgets/merchant_card.dart';
import 'package:pile_up/features/home/presentation/widgets/middle_carousel_card.dart';
import 'package:pile_up/features/home/presentation/widgets/top_carousel.dart';
import 'package:pile_up/features/main_screen.dart';
import 'package:pile_up/features/merchants/presentation/merchant_details/merchants_list.dart';
import 'package:pile_up/features/vendors/presentation/vendors_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;

  final myitems = [
    const MiddleCarouselCard(),
    const MiddleCarouselCard(),
    const MiddleCarouselCard(),
  ];
  final myitems2 = [
    const OurMerchantCard(),
    const OurMerchantCard(),
    const OurMerchantCard(),
    const OurMerchantCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context,leadingOnPressed: () {
        Scaffold.of(context).openDrawer();
      }),


      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopCarousel(),
            SizedBox(
              height: AppSize.defaultSize! * 1.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                viewRow(text: StringManager.myPiles.tr(), onTap: () {
                  MainScreen.mainIndex=1;
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const MainScreen(),
                    withNavBar: false,
                    pageTransitionAnimation:
                    PageTransitionAnimation.fade,
                  );
                }),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 12,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize! * .5),
                          child: InkWell(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const PilesDetails(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                );
                              },
                              child: const MiddleCarouselCard() .animate()
                                  .fadeIn() // uses `Animate.defaultDuration`
                                  .scale() // inherits duration from fadeIn
                                  .move(delay: 300.ms, duration: 600.ms),),
                        );
                      }),
                ),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                viewRow(text: StringManager.ourMerchant.tr(), onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const MerchantDetails(),
                    withNavBar: false,
                    pageTransitionAnimation:
                    PageTransitionAnimation.fade,
                  );
                }),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: .3,
                      autoPlay: true,
                      height: AppSize.screenHeight! * .17,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      }),
                  items: myitems2,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.5,
                ),
                viewRow(text: StringManager.ourVendors.tr(), onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const VendorsScreen(),
                    withNavBar: false,
                    pageTransitionAnimation:
                    PageTransitionAnimation.fade,
                  );
                }),
                SizedBox(
                  height: AppSize.defaultSize!,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: .3,
                      autoPlay: true,
                      height: AppSize.screenHeight! * .17,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      }),
                  items: myitems2,
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.5,
                ),
                viewRow(
                    text: StringManager.recentUsefulArticles.tr(),
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const BlogDetails(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    }),
                SizedBox(
                  height: AppSize.defaultSize! * 1.5),
                SizedBox(
                  height: AppSize.defaultSize! * 12,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(AppSize.defaultSize! * .5),
                          child: InkWell(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const BlogScreen(),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.fade,
                                );
                              },
                              child: const MiddleCarouselCard(
                                text: 'The most ingenious tecycled homos',
                              ) .animate()
                                  .fadeIn() // uses `Animate.defaultDuration`
                                  .scale() // inherits duration from fadeIn
                                  .move(delay: 300.ms, duration: 600.ms),),
                        );
                      }),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget viewRow({void Function()? onTap, String? text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            color: AppColors.blackMedium,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.defaultSize! * 1.6,
          ),
          InkWell(
            onTap: onTap,
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
    );
  }
}
