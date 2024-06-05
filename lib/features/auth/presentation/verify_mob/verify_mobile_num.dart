import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class VerifyMobNumScreen extends StatefulWidget {
  const VerifyMobNumScreen({super.key});

  @override
  State<VerifyMobNumScreen> createState() => _VerifyMobNumScreenState();
}

class _VerifyMobNumScreenState extends State<VerifyMobNumScreen> {
  late TextEditingController mobileController;

  @override
  void initState() {
    mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 8.4,
            ),
            Image.asset(
              AssetPath.logo1,
              height: AppSize.defaultSize! * 7.8,
              width: AppSize.defaultSize! * 10.1,
            ),
            SizedBox(height: AppSize.defaultSize!*1.3),
            CustomText(
              text: StringManager.welcomeBack.tr(),
              fontSize: AppSize.defaultSize! * 2,
              fontWeight: FontWeight.bold,
              color: AppColors.welcomeTextVerifyMob,
            ),
            CustomText(
              text: StringManager.typeUrMobNum.tr(),
              fontSize: AppSize.defaultSize! * 1.4,
              color: AppColors.welcomeTextVerifyMob,
            ),
            SizedBox(height: AppSize.defaultSize!*4.8),
            ColumnWithTextField(
              text: StringManager.mobileNum.tr(),
              controller: mobileController,
              fontSize: AppSize.defaultSize!*1.4,
            ),
            SizedBox(height: AppSize.defaultSize!*1.6),
            MainButton(
              text: StringManager.continueScreen.tr(),
              fontSize: AppSize.defaultSize!*1.8,
              fontWeight: FontWeight.w600,
              onTap: () {
                Navigator.pushNamed(context, Routes.verifyOTPScreen);
              },
              // width: AppSize.screenWidth! * .9,
            ),
          ],
        ),
      ),
    );
  }
}
