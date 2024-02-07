import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/on_boarding/on_boarding.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView(this.index, {Key? key}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding:   EdgeInsets.all(AppSize.defaultSize!*2),
            child: TextButton(
                onPressed: () {

                  Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false);


                },
                child: CustomText(
                  text: StringManager.skip.tr(),
                  color: AppColors.blackLow,
                )),
          ),
        ),

        Padding(
          padding:   EdgeInsets.symmetric(horizontal: AppSize.defaultSize!*3.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: AppSize.defaultSize!*2),
              Container(
                alignment: Alignment.center,
                height:AppSize.screenHeight!* 0.5,
                padding:   EdgeInsets.all(AppSize.defaultSize!),
                child: Image.asset('assets/images/boarding${index + 1}.png'),
              ),
              CustomText(
                text: onBoardingList[index]['title'],
                textAlign: TextAlign.start,
                color: AppColors.primaryColor,
                fontSize: AppSize.defaultSize!*2,
                maxLines: 2,
                fontWeight: FontWeight.w500,
              ),
                SizedBox(height: AppSize.defaultSize!*2),
              CustomText(
                text:  onBoardingList[index]['description'],
                textAlign: TextAlign.start,
                color: AppColors.blackLow,
                height: 1,
                maxLines: 6,
                fontSize: AppSize.defaultSize!*1.8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
