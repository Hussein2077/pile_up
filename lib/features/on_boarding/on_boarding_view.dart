import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/on_boarding/on_boarding.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: AppSize.defaultSize! * 1.6,
          right: AppSize.defaultSize! * 1.6,
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * 2),
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
                  child: CustomText(
                    text: StringManager.skip.tr(),
                    color: AppColors.blackLow,
                    fontSize: AppSize.defaultSize! * 2,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.defaultSize! * 2),
              Container(
                height: AppSize.screenHeight!*.48,
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.all(AppSize.defaultSize!),
                child: Image.asset('assets/images/boarding${index + 1}.png')
                    .animate()
                    .fadeIn() // uses `Animate.defaultDuration`
                    .scale() // inherits duration from fadeIn
                    .move(delay: 300.ms, duration: 600.ms),
              ),
              CustomText(
                text: onBoardingList[index]['title'],
                textAlign: TextAlign.start,
                color: AppColors.primaryColor,
                fontSize: AppSize.defaultSize! * 2.2,
                maxLines: 2,
                fontWeight: FontWeight.w500,
              )
                  .animate()
                  .fadeIn() // uses `Animate.defaultDuration`
                  .scale() // inherits duration from fadeIn
                  .move(delay: 300.ms, duration: 600.ms),
              SizedBox(height: AppSize.defaultSize! * 1.2),
              CustomText(
                text: onBoardingList[index]['description'],
                textAlign: TextAlign.start,
                color: AppColors.blackLow,
                height: 1,
                overflow: TextOverflow.ellipsis,
                maxLines:6,
                fontSize: AppSize.defaultSize! * 1.6,
              )
                  .animate()
                  .fadeIn() // uses `Animate.defaultDuration`
                  .scale() // inherits duration from fadeIn
                  .move(delay: 300.ms, duration: 600.ms),
            ],
          ),
        ),
      ],
    );
  }
}
