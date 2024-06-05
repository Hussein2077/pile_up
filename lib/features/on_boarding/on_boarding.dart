import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/on_boarding/on_boarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List onBoardingList = [
  {
    'title': StringManager.boarding1.tr(),
    'description': StringManager.description1.tr(),
    'image': AssetPath.boarding1,
  },
  {
    'title': StringManager.boarding2.tr(),
    'description': StringManager.description2.tr(),
    'image': AssetPath.boarding2,
  },
  {
    'title': StringManager.boarding3.tr(),
    'description': StringManager.description3.tr(),
    'image': AssetPath.boarding3,
  },
  {
    'title': StringManager.boarding4.tr(),
    'description': StringManager.description4.tr(),
    'image': AssetPath.boarding4,
  }
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController(initialPage: 0);
  ValueNotifier<bool> backButton = ValueNotifier<bool>(false);
  ValueNotifier<bool> changeToNext = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppSize.screenHeight! * 0.8,

            child: PageView(
              controller: controller,
              onPageChanged: (page) {
                if (page == 0) {
                  backButton.value = false;
                } else {
                  backButton.value = true;
                }
                if (page == 3) {
                  changeToNext.value = true;
                } else {
                  changeToNext.value = false;
                }
              },
              children: List.generate(
                  onBoardingList.length, (index) => OnboardingView(index)),
            ),
          ),
          SizedBox(height: AppSize.defaultSize! * 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                    controller: controller, // PageController
                    count: onBoardingList.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: AppSize.defaultSize!,
                      dotWidth: AppSize.defaultSize!,
                      activeDotColor: AppColors.primaryColor,
                      radius: AppSize.defaultSize! * 5,
                      dotColor: AppColors.primaryColor.withOpacity(.3),
                    ), // your preferred effect
                    onDotClicked: (index) {}),
                const Spacer(),
                ValueListenableBuilder(
                    valueListenable: backButton,
                    builder: (context, show, _) {
                      return show
                          ? InkWell(
                              onTap: () {
                                controller.animateToPage(
                                    controller.page!.toInt() - 1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: CustomText(
                                text: StringManager.back.tr(),
                                color: AppColors.primaryColor,
                                // fontWeight: FontWeight.w500,
                                fontSize:AppSize.defaultSize!*2,
                              ))
                          : const SizedBox();
                    }),
                SizedBox(width: AppSize.defaultSize!*2.4),
                ValueListenableBuilder(
                    valueListenable: changeToNext,
                    builder: (context, show, _) {
                      return SecondButton(
                        showIconAsset: false,
                        showIcon: false,

                        text: show
                            ? StringManager.start.tr()
                            : StringManager.next.tr(),
                        width: AppSize.defaultSize! * 12.7,
                        height: AppSize.defaultSize! * 4,
                        onTap: () {
                          controller.animateToPage(controller.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                          if (show) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.login, (route) => false);
                          }
                        },
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
